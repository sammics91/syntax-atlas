FROM python:3.13-slim

# 不產生 Python 快取檔，並即時輸出日誌
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# 先安裝套件，方便重用建置快取
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製 API 與維護工具需要的程式
COPY main.py \
     database.py \
     analyzer.py \
     analyzer_html.py \
     auth.py \
     records.py \
     syntax_statistics.py \
     bookmarks.py \
     password_reset.py \
     mailer.py \
     cleanup_sessions.py \
     python_syntaxes.py \
     migrate.py \
     ./

# 複製部署時需要的資料庫更新 SQL
COPY database/ ./database/

# 使用一般帳號執行
RUN useradd --create-home appuser
USER appuser

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
