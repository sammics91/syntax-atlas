"""忘記密碼與重設密碼功能。"""

import hashlib
import logging
import secrets

from fastapi import APIRouter, BackgroundTasks, HTTPException, Response
from pydantic import BaseModel, EmailStr, Field

from auth import SESSION_COOKIE_NAME, password_hasher
from database import get_db_connection
from mailer import send_email, send_password_reset_email


router = APIRouter(prefix="/api", tags=["密碼重設"])
logger = logging.getLogger(__name__)


# 申請重設密碼時接收的資料。
class ForgotPasswordRequest(BaseModel):
    email: EmailStr = Field(max_length=254)

# 使用信中憑證重設密碼；密碼不移除頭尾空白。
class ResetPasswordRequest(BaseModel):
    token: str = Field(min_length=43, max_length=128)
    new_password: str = Field(min_length=8, max_length=19)
    confirm_password: str = Field(min_length=8, max_length=19)


def process_password_reset_request(email: str):
    """背景處理申請，不將帳號是否存在回傳給前端。"""

    connection = None

    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        try:
            # 鎖定會員資料，避免同時申請產生多封重設信。
            cursor.execute(
                """
                SELECT id, email
                FROM users
                WHERE email = %s
                FOR UPDATE
                """,
                (email,),
            )

            member = cursor.fetchone()

            if member is None:
                return

            # 同一會員 60 秒內不重複產生憑證或寄信。
            cursor.execute(
                """
                SELECT
                    created_at > DATE_SUB(
                        UTC_TIMESTAMP(), INTERVAL 60 SECOND
                    ) AS cooling_down
                FROM password_reset_tokens
                WHERE user_id = %s
                """,
                (member["id"],),
            )

            previous = cursor.fetchone()

            if previous and previous["cooling_down"]:
                return

            # 原始憑證只放進郵件，不保存於資料庫。
            token = secrets.token_urlsafe(32)

            token_hash = hashlib.sha256(
                token.encode("utf-8")
            ).hexdigest()

            # 每位會員只保留最新一筆憑證，效期 15 分鐘。
            cursor.execute(
                """
                INSERT INTO password_reset_tokens (
                    user_id,
                    token_hash,
                    created_at,
                    expires_at,
                    used_at
                )
                VALUES (
                    %s,
                    %s,
                    UTC_TIMESTAMP(),
                    DATE_ADD(UTC_TIMESTAMP(), INTERVAL 15 MINUTE),
                    NULL
                )
                ON DUPLICATE KEY UPDATE
                    token_hash = %s,
                    created_at = UTC_TIMESTAMP(),
                    expires_at = DATE_ADD(
                        UTC_TIMESTAMP(), INTERVAL 15 MINUTE
                    ),
                    used_at = NULL
                """,
                (
                    member["id"],
                    token_hash,
                    token_hash,
                ),
            )

            connection.commit()
            recipient = member["email"]

        finally:
            cursor.close()

    except Exception as error:
        if connection is not None:
            connection.rollback()

        # 不記錄 Email、原始憑證或重設連結。
        logger.error(
            "Password reset preparation failed (%s).",
            type(error).__name__,
        )
        return

    finally:
        if connection is not None:
            connection.close()

    # 資料庫提交並釋放連線後，才進行外部寄信請求。
    try:
        send_password_reset_email(recipient, token)
    except Exception as error:
        logger.error(
            "Password reset email failed (%s).",
            type(error).__name__,
        )

# 完成通知 & 信件內容
def send_password_reset_completed_email(recipient: str):
    """通知密碼已重設，不在信中包含任何密碼。"""

    try:
        send_email(
            recipient=recipient,
            subject="你的 Syntax Atlas 密碼已重設",
            text=(
                "你的 Syntax Atlas 密碼已成功重設，"
                "所有裝置的登入狀態已失效。\n\n"
                "請使用新密碼重新登入。\n\n"
                "如果這不是你的操作，請立即重新申請重設密碼，"
                "並檢查你的 Email 帳號安全。\n\n"
                "Syntax Atlas"
            ),
        )
    except Exception as error:
        # 通知信失敗，不撤銷已完成的密碼更新。
        logger.error(
            "Password reset notification failed (%s).",
            type(error).__name__,
        )


# --- POST /api/forgot-password 申請重設密碼 ---
@router.post("/forgot-password", status_code=202)
def forgot_password(
    request: ForgotPasswordRequest,
    background_tasks: BackgroundTasks,
):
    # 帳號是否存在，都透過相同的背景流程處理。
    background_tasks.add_task(
        process_password_reset_request,
        str(request.email),
    )

    return {
        "message": (
            "若此 Email 已註冊，將收到重設連結。"
            "若未收到，請檢查垃圾郵件匣或一分鐘後重試。"
        )
    }


# --- POST /api/reset-password 驗證憑證並重設密碼 ---
@router.post("/reset-password")
def reset_password(
    request: ResetPasswordRequest,
    response: Response,
    background_tasks: BackgroundTasks,
):
    if request.new_password != request.confirm_password:
        raise HTTPException(
            status_code=400,
            detail="兩次輸入的新密碼不一致。",
        )

    token_hash = hashlib.sha256(
        request.token.encode("utf-8")
    ).hexdigest()

    invalid_message = (
        "重設連結無效、已過期或已使用，請重新申請。"
    )

    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 先找出憑證所屬會員；稍後取得鎖後會重新驗證。
            cursor.execute(
                """
                SELECT user_id
                FROM password_reset_tokens
                WHERE token_hash = %s
                """,
                (token_hash,),
            )

            token_owner = cursor.fetchone()

            if token_owner is None:
                raise HTTPException(
                    status_code=400,
                    detail=invalid_message,
                )

            user_id = token_owner["user_id"]

            # 與申請重設、會員修改密碼使用相同鎖定順序。
            cursor.execute(
                """
                SELECT id, email
                FROM users
                WHERE id = %s
                FOR UPDATE
                """,
                (user_id,),
            )

            member = cursor.fetchone()

            if member is None:
                raise HTTPException(
                    status_code=400,
                    detail=invalid_message,
                )

            # 重新確認憑證仍是最新、未使用且尚未到期。
            cursor.execute(
                """
                SELECT user_id
                FROM password_reset_tokens
                WHERE user_id = %s
                  AND token_hash = %s
                  AND used_at IS NULL
                  AND expires_at > UTC_TIMESTAMP()
                FOR UPDATE
                """,
                (user_id, token_hash),
            )

            if cursor.fetchone() is None:
                raise HTTPException(
                    status_code=400,
                    detail=invalid_message,
                )

            new_password_hash = password_hasher.hash(
                request.new_password
            )

            cursor.execute(
                """
                UPDATE users
                SET password_hash = %s
                WHERE id = %s
                """,
                (new_password_hash, user_id),
            )

            # 只有成功更新密碼時，才消耗憑證。
            cursor.execute(
                """
                UPDATE password_reset_tokens
                SET used_at = UTC_TIMESTAMP()
                WHERE user_id = %s AND token_hash = %s
                """,
                (user_id, token_hash),
            )

            # 撤銷該會員所有裝置的登入憑證。
            cursor.execute(
                """
                DELETE FROM user_sessions
                WHERE user_id = %s
                """,
                (user_id,),
            )

            # 密碼、憑證使用狀態與登出一起提交。
            connection.commit()
            recipient = member["email"]

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    response.delete_cookie(
        key=SESSION_COOKIE_NAME,
        path="/",
        httponly=True,
        secure=False,  # 與目前登入／登出的 Cookie 設定一致
        samesite="lax",
    )

    background_tasks.add_task(
        send_password_reset_completed_email,
        recipient,
    )

    return {
        "message": "密碼已重設，請使用新密碼重新登入。"
    }