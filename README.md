# Syntax Atlas

提供程式碼分析與語法快速查閱的語法辭典平台，並提供個人程式碼分析紀錄及語法使用統計。

## 初版功能

- Python AST 語法分析
- 語法辭典與說明展開
- 會員註冊、登入與登出
- 程式碼紀錄儲存與編輯
- 僅移除程式碼，或完全刪除紀錄及統計
- 個人常用語法排名
- 響應式版面

## 技術

- 前端：Next.js、React、TypeScript、CSS Modules
- 後端：FastAPI、Python AST
- 資料庫：MySQL
- 容器：Docker Compose

## 本機 Docker 執行

啟動前需準備：

- Docker Desktop
- 已建立資料表並匯入語法資料的本機 MySQL
- backend/.env 中的資料庫連線設定

目前 Compose 透過 host.docker.internal 連接主機上的 MySQL，
不會另外建立 MySQL 容器。

在專案根目錄執行：

```powershell
docker compose -p syntax-atlas-dev build
docker compose -p syntax-atlas-dev up -d
```

網站網址：http://localhost:8081

查看容器狀態：

```powershell
docker compose -p syntax-atlas-dev ps
```

停止並移除本次容器與網路：

```powershell
docker compose -p syntax-atlas-dev down
```

上述 down 指令不會刪除主機上的 MySQL 資料或建置完成的映像。

## 初版映像

- syntax-atlas-frontend:v1.0.0
- syntax-atlas-backend:v1.0.0

本版本已通過本機容器功能測試，未更新 EC2 正式環境。
映像不包含資料庫內容與 backend/.env。