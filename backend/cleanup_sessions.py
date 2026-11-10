from database import get_db_connection


def cleanup_expired_sessions():
    connection = get_db_connection()

    try:
        cursor = connection.cursor()

        try:
            # 與登入驗證使用相同的 UTC 時間基準
            cursor.execute(
                """
                DELETE FROM user_sessions
                WHERE expires_at <= UTC_TIMESTAMP()
                """
            )

            deleted_count = cursor.rowcount
            connection.commit()

        finally:
            cursor.close()

    except Exception:
        connection.rollback()
        raise

    finally:
        connection.close()

    return deleted_count


if __name__ == "__main__":
    deleted_count = cleanup_expired_sessions()
    print(f"已清除 {deleted_count} 筆過期登入憑證。")