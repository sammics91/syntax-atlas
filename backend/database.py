import os
from pathlib import Path

import mysql.connector
from dotenv import load_dotenv


# 讀取 backend 資料夾裡的環境設定。
env_path = Path(__file__).resolve().parent / ".env"
load_dotenv(env_path)


# 從共用連線池取得連線。
def get_db_connection():
    return mysql.connector.connect(
        pool_name="syntax_atlas",
        pool_size=int(os.environ.get("DB_POOL_SIZE", "5")),
        pool_reset_session=True,
        host=os.environ["DB_HOST"],
        port=int(os.environ.get("DB_PORT", "3306")),
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
        database=os.environ["DB_NAME"],
        charset="utf8mb4",
    )