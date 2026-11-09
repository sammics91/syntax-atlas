"""後端共用寄信功能；匯入此檔不會自動寄信。"""

import os
from pathlib import Path
from urllib.parse import urlencode

import requests
from dotenv import load_dotenv


# 本機讀取 .env；部署時也可由容器環境變數提供設定。
load_dotenv(Path(__file__).resolve().parent / ".env")


def send_email(
    recipient: str,
    subject: str,
    text: str,
) -> str:
    """寄出純文字郵件，回傳 Resend 的郵件 ID。"""

    api_key = os.environ.get("RESEND_API_KEY", "").strip()
    mail_from = os.environ.get("MAIL_FROM", "").strip()

    if not api_key or not mail_from:
        raise RuntimeError("寄信服務尚未設定完成。")

    try:
        response = requests.post(
            "https://api.resend.com/emails",
            headers={
                "Authorization": f"Bearer {api_key}",
                "Content-Type": "application/json",
            },
            json={
                "from": mail_from,
                "to": [recipient],
                "subject": subject,
                "text": text,
            },
            timeout=15,
        )
    except requests.RequestException:
        # 不輸出請求內容，避免日誌包含重設連結或憑證。
        raise RuntimeError(
            "無法確認寄信結果，請查看寄信服務紀錄。"
        ) from None

    if not response.ok:
        raise RuntimeError(
            f"寄信服務回傳錯誤：HTTP {response.status_code}"
        )

    try:
        email_id = response.json()["id"]

        if not isinstance(email_id, str) or not email_id:
            raise ValueError
    except (ValueError, KeyError, TypeError):
        raise RuntimeError(
            "寄信服務回應格式不正確。"
        ) from None

    return email_id


def send_password_reset_email(
    recipient: str,
    token: str,
) -> str:
    """寄送重設密碼連結；有效期限由後端 API 驗證。"""

    app_url = os.environ.get("PUBLIC_APP_URL", "").strip().rstrip("/")

    if not app_url:
        raise RuntimeError("尚未設定 PUBLIC_APP_URL。")

    # 開啟首頁，由首頁自動顯示重設密碼視窗。
    fragment = urlencode({"reset_token": token})
    reset_url = f"{app_url}/#{fragment}"

    return send_email(
        recipient=recipient,
        subject="重設你的 Syntax Atlas 密碼",
        text=(
            "我們收到了你的密碼重設申請。\n\n"
            "請開啟以下連結設定新密碼：\n"
            f"{reset_url}\n\n"
            "連結有效期限為 15 分鐘，且只能成功使用一次。\n"
            "如果你沒有申請重設密碼，請忽略這封信；"
            "你的密碼不會因此改變。\n\n"
            "Syntax Atlas"
        ),
    )