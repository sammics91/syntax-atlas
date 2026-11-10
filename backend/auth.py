import hashlib
import secrets
from datetime import datetime, timedelta, timezone

from fastapi import APIRouter, Depends, HTTPException, Request, Response
from mysql.connector import IntegrityError
from pydantic import BaseModel, EmailStr, Field, field_validator
from pwdlib import PasswordHash

from database import get_db_connection


# --- 會員系統設定 ---

# 會員 API 共用 /api 前綴
router = APIRouter(prefix="/api", tags=["會員"])


# 建立密碼雜湊與驗證工具
password_hasher = PasswordHash.recommended()

# 帳號不存在時，也進行一次密碼驗證，減少回應時間差異
dummy_password_hash = password_hasher.hash(secrets.token_urlsafe(32))

# 登入有效期限：3 天，單位為秒
SESSION_MAX_AGE = 3 * 24 * 60 * 60

# 瀏覽器保存登入憑證的 Cookie 名稱
SESSION_COOKIE_NAME = "syntax_atlas_session"


# --- 請求資料格式 ---

# 註冊時接收的資料
class SignupRequest(BaseModel):
    name: str = Field(min_length=1, max_length=14)
    email: EmailStr = Field(max_length=254)
    password: str = Field(min_length=8, max_length=19)

    # 先移除姓名前後空白，再進行長度驗證
    @field_validator("name", mode="before")
    @classmethod
    def trim_name(cls, value):
        if isinstance(value, str):
            return value.strip()
        return value


# 登入時接收的資料
class SigninRequest(BaseModel):
    email: EmailStr = Field(max_length=254)
    password: str = Field(min_length=8, max_length=19)


# 修改暱稱時接收的資料。
class UpdateNameRequest(BaseModel):
    name: str = Field(min_length=1, max_length=14)

    # 與註冊相同：移除頭尾空白後，再驗證長度。
    @field_validator("name", mode="before")
    @classmethod
    def trim_name(cls, value):
        if isinstance(value, str):
            return value.strip()
        return value


# 修改密碼時接收的資料；密碼不移除頭尾空白。
class UpdatePasswordRequest(BaseModel):
    current_password: str = Field(min_length=8, max_length=19)
    new_password: str = Field(min_length=8, max_length=19)
    confirm_password: str = Field(min_length=8, max_length=19)


# 刪除帳號時，必須輸入目前使用的密碼。
class DeleteAccountRequest(BaseModel):
    password: str = Field(min_length=8, max_length=19)


# --- 回應資料格式 ---

# 回傳給前端的會員資料，不包含密碼雜湊
class UserResponse(BaseModel):
    id: int
    name: str
    email: EmailStr


# 會員資訊視窗使用的資料，不包含密碼或密碼雜湊。
class ProfileResponse(BaseModel):
    id: int
    name: str
    email: EmailStr
    created_at: datetime



# --- GET /api/auth 查詢目前會員登入狀態 ---
@router.get("/auth", response_model=UserResponse)
def get_current_user(request: Request):
    # 從 Cookie 取得原始登入憑證
    token = request.cookies.get(SESSION_COOKIE_NAME)

    if not token:
        raise HTTPException(
            status_code=401,
            detail="尚未登入。",
        )

    # 轉成雜湊，才能與資料庫保存的值比對
    token_hash = hashlib.sha256(
        token.encode("utf-8")
    ).hexdigest()

    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 憑證必須存在，且尚未到期
            cursor.execute(
                """
                SELECT u.id, u.name, u.email
                FROM user_sessions AS s
                JOIN users AS u
                    ON s.user_id = u.id
                WHERE s.token_hash = %s
                  AND s.expires_at > UTC_TIMESTAMP()
                """,
                (token_hash,),
            )

            user = cursor.fetchone()

        finally:
            cursor.close()

    finally:
        connection.close()

    if user is None:
        raise HTTPException(
            status_code=401,
            detail="登入已失效，請重新登入。",
        )

    return user


# --- POST /api/signup 註冊 ---
@router.post(
    "/signup",
    status_code=201,
    response_model=UserResponse,
)
def signup(request: SignupRequest):
    # 只儲存雜湊結果，不儲存原始密碼
    hashed_password = password_hasher.hash(request.password)

    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 使用參數傳入資料，不直接拼接 SQL 字串
            cursor.execute(
                """
                INSERT INTO users (name, email, password_hash)
                VALUES (%s, %s, %s)
                """,
                (
                    request.name,
                    str(request.email),
                    hashed_password,
                ),
            )

            user_id = cursor.lastrowid
            connection.commit()

        finally:
            cursor.close()

    except IntegrityError as error:
        connection.rollback()

        # MySQL 1062：違反唯一值限制
        if error.errno == 1062:
            raise HTTPException(
                status_code=409,
                detail="此 Email 已被註冊。",
            ) from error

        raise

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    return {
        "id": user_id,
        "name": request.name,
        "email": str(request.email),
    }


# --- POST /api/signin 登入 ---
@router.post("/signin", response_model=UserResponse)
def signin(request: SigninRequest, response: Response):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 依 Email 查詢會員
            cursor.execute(
                """
                SELECT id, name, email, password_hash
                FROM users
                WHERE email = %s
                """,
                (str(request.email),),
            )

            user = cursor.fetchone()

            # 帳號不存在時，使用假雜湊進行驗證
            stored_hash = (
                user["password_hash"]
                if user
                else dummy_password_hash
            )

            password_is_valid = password_hasher.verify(
                request.password,
                stored_hash,
            )

            # 帳號不存在或密碼錯誤，都使用相同提示
            if user is None or not password_is_valid:
                raise HTTPException(
                    status_code=401,
                    detail="Email 或密碼錯誤。",
                )

            # 產生隨機登入憑證
            token = secrets.token_urlsafe(32)

            # 資料庫只保存憑證的 SHA-256 雜湊
            token_hash = hashlib.sha256(
                token.encode("utf-8")
            ).hexdigest()

            # MySQL DATETIME 不帶時區，因此轉為 UTC 後移除時區標記
            expires_at = (
                datetime.now(timezone.utc)
                + timedelta(seconds=SESSION_MAX_AGE)
            ).replace(tzinfo=None)

            # 建立這次登入的 Session
            cursor.execute(
                """
                INSERT INTO user_sessions (
                    user_id,
                    token_hash,
                    expires_at
                )
                VALUES (%s, %s, %s)
                """,
                (user["id"], token_hash, expires_at),
            )

            connection.commit()

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    # 原始憑證放入 Cookie，不放進回傳的 JSON
    response.set_cookie(
        key=SESSION_COOKIE_NAME,
        value=token,
        max_age=SESSION_MAX_AGE,
        httponly=True,
        secure=False,  # 本機 HTTP 開發；正式 HTTPS 上線時改為 True
        samesite="lax",
        path="/",
    )

    return {
        "id": user["id"],
        "name": user["name"],
        "email": user["email"],
    }


# --- POST /api/signout 登出 ---
@router.post("/signout")
def signout(request: Request, response: Response):
    # 取得目前登入憑證
    token = request.cookies.get(SESSION_COOKIE_NAME)

    if token:
        token_hash = hashlib.sha256(
            token.encode("utf-8")
        ).hexdigest()

        connection = get_db_connection()

        try:
            cursor = connection.cursor()

            try:
                # 只刪除目前裝置的 Session
                cursor.execute(
                    """
                    DELETE FROM user_sessions
                    WHERE token_hash = %s
                    """,
                    (token_hash,),
                )

                connection.commit()

            finally:
                cursor.close()

        except Exception:
            connection.rollback()
            raise

        finally:
            connection.close()

    # 清除 Cookie，名稱與 path 必須對應登入時的設定
    response.delete_cookie(
        key=SESSION_COOKIE_NAME,
        path="/",
        httponly=True,
        secure=False,  # 正式 HTTPS 上線時，與登入設定一起改為 True
        samesite="lax",
    )

    return {"message": "已登出。"}


# --- GET /api/profile 取得自己的會員資訊 ---
@router.get("/profile", response_model=ProfileResponse)
def get_profile(user: dict = Depends(get_current_user)):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                SELECT id, name, email, created_at
                FROM users
                WHERE id = %s
                """,
                (user["id"],),
            )

            profile = cursor.fetchone()

            if profile is None:
                raise HTTPException(
                    status_code=401,
                    detail="會員資料不存在，請重新登入。",
                )

            return profile

        finally:
            cursor.close()

    finally:
        connection.close()


# --- PUT /api/profile/name 修改自己的暱稱 ---
@router.put("/profile/name", response_model=UserResponse)
def update_name(
    request: UpdateNameRequest,
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            cursor.execute(
                """
                UPDATE users
                SET name = %s
                WHERE id = %s
                """,
                (request.name, user["id"]),
            )

            # 回傳最新會員資料，供前端同步更新導覽列。
            cursor.execute(
                """
                SELECT id, name, email
                FROM users
                WHERE id = %s
                """,
                (user["id"],),
            )

            updated_user = cursor.fetchone()

            if updated_user is None:
                raise HTTPException(
                    status_code=401,
                    detail="會員資料不存在，請重新登入。",
                )

            connection.commit()
            return updated_user

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()


# --- PUT /api/profile/password 修改自己的密碼 ---
@router.put("/profile/password")
def update_password(
    request: UpdatePasswordRequest,
    response: Response,
    user: dict = Depends(get_current_user),
):
    if request.new_password != request.confirm_password:
        raise HTTPException(
            status_code=400,
            detail="兩次輸入的新密碼不一致。",
        )

    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 鎖定會員資料，避免同時修改密碼。
            cursor.execute(
                """
                SELECT password_hash
                FROM users
                WHERE id = %s
                FOR UPDATE
                """,
                (user["id"],),
            )

            member = cursor.fetchone()

            if member is None:
                raise HTTPException(
                    status_code=401,
                    detail="會員資料不存在，請重新登入。",
                )

            password_is_valid = password_hasher.verify(
                request.current_password,
                member["password_hash"],
            )

            if not password_is_valid:
                raise HTTPException(
                    status_code=400,
                    detail="目前密碼不正確。",
                )

            if request.new_password == request.current_password:
                raise HTTPException(
                    status_code=400,
                    detail="新密碼不能與目前密碼相同。",
                )

            # 只保存新密碼的雜湊。
            new_password_hash = password_hasher.hash(
                request.new_password
            )

            cursor.execute(
                """
                UPDATE users
                SET password_hash = %s
                WHERE id = %s
                """,
                (new_password_hash, user["id"]),
            )

            # 撤銷所有裝置的登入憑證，包含目前裝置。
            cursor.execute(
                """
                DELETE FROM user_sessions
                WHERE user_id = %s
                """,
                (user["id"],),
            )

            # 會員自行修改密碼後，先前寄出的重設連結也失效。
            cursor.execute(
                """
                DELETE FROM password_reset_tokens
                WHERE user_id = %s
                """,
                (user["id"],),
            )

            # 密碼與憑證一起更新，任一步失敗就一起撤銷。
            connection.commit()

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    # 清除目前瀏覽器的登入 Cookie。
    response.delete_cookie(
        key=SESSION_COOKIE_NAME,
        path="/",
        httponly=True,
        secure=False,  # 與目前登入／登出的 Cookie 設定一致
        samesite="lax",
    )

    return {
        "message": "密碼已更新，請使用新密碼重新登入。"
    }


# --- DELETE /api/profile 驗證密碼後，刪除自己的帳號 ---
@router.delete("/profile")
def delete_account(
    request: DeleteAccountRequest,
    response: Response,
    user: dict = Depends(get_current_user),
):
    connection = get_db_connection()

    try:
        cursor = connection.cursor(dictionary=True)

        try:
            # 鎖定會員資料，與密碼修改操作互相協調。
            cursor.execute(
                """
                SELECT password_hash
                FROM users
                WHERE id = %s
                FOR UPDATE
                """,
                (user["id"],),
            )

            member = cursor.fetchone()

            if member is None:
                raise HTTPException(
                    status_code=401,
                    detail="會員資料不存在，請重新登入。",
                )

            password_is_valid = password_hasher.verify(
                request.password,
                member["password_hash"],
            )

            if not password_is_valid:
                raise HTTPException(
                    status_code=400,
                    detail="輸入的密碼不正確。",
                )

            # 外鍵連動刪除：
            # 程式碼紀錄、使用次數、收藏及所有登入憑證。
            cursor.execute(
                """
                DELETE FROM users
                WHERE id = %s
                """,
                (user["id"],),
            )

            connection.commit()

        finally:
            cursor.close()

    except Exception:
        # 刪除失敗時，撤銷本次交易。
        connection.rollback()
        raise

    finally:
        connection.close()

    # 資料庫刪除成功後，再清除目前瀏覽器的 Cookie。
    response.delete_cookie(
        key=SESSION_COOKIE_NAME,
        path="/",
        httponly=True,
        secure=False,  # 與目前登入／登出的 Cookie 設定一致
        samesite="lax",
    )

    return {
        "message": "帳號已刪除。"
    }
