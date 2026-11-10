#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

# 第一個引數是這次要部署的完整 Git commit 編號。
export RELEASE_SHA="${1:?請提供發布版本}"

if [[ ! "$RELEASE_SHA" =~ ^[0-9a-f]{40}$ ]]; then
    echo "發布版本必須是完整的 40 碼 commit 編號"
    exit 1
fi

# Actions 會將腳本與 compose.release.yaml 放在同一個發布資料夾。
release_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$HOME/syntax-atlas"

# 同一台主機一次只執行一個部署。
exec 9>.deploy.lock
flock -w 600 9

compose=(
    docker compose
    --env-file .env.deploy
    -f compose.yaml
    -f "$release_dir/compose.release.yaml"
)

trap 'echo "部署未完成，請查看失敗步驟；不會自動還原資料庫。"' ERR

echo "部署版本：$RELEASE_SHA"

echo "1. 下載前後端映像"
"${compose[@]}" pull backend frontend

echo "2. 檢查更新檔"
"${compose[@]}" run --rm --no-deps backend python migrate.py

echo "3. 備份資料庫"
mkdir -p backup
backup_file="backup/before-deploy-$(date +%Y%m%d-%H%M%S)-$RELEASE_SHA.sql"

"${compose[@]}" exec -T db sh -c \
    'export MYSQL_PWD="$MYSQL_ROOT_PASSWORD"; exec mysqldump --single-transaction --no-tablespaces --routines --triggers --events "$MYSQL_DATABASE"' \
    > "$backup_file"

test -s "$backup_file"
echo "備份完成：$backup_file"

echo "4. 套用資料庫更新"
"${compose[@]}" run --rm --no-deps backend python migrate.py --apply

echo "5. 更新前後端容器"
"${compose[@]}" up -d --no-deps backend frontend

echo "6. 等待網站與 API 正常"
healthy=false

for attempt in {1..24}; do
    if "${compose[@]}" exec -T backend python -c \
        'import json, urllib.request; response = urllib.request.urlopen("http://127.0.0.1:8000/api/syntaxes", timeout=5); data = json.load(response); assert data["syntaxes"]' \
        >/dev/null 2>&1 \
        && curl --fail --silent --show-error --max-time 10 \
            --output /dev/null https://syntax.sammics.cc/ \
        && curl --fail --silent --show-error --max-time 10 \
            --output /dev/null https://syntax.sammics.cc/api/syntaxes; then
        healthy=true
        break
    fi

    sleep 5
done

if [[ "$healthy" != true ]]; then
    echo "網站檢查未通過，請查看容器狀態與日誌"
    exit 1
fi

echo "7. 保存成功部署的版本"
cp "$release_dir/compose.release.yaml" compose.release.yaml
printf 'RELEASE_SHA=%s\n' "$RELEASE_SHA" > .env.release.tmp
mv .env.release.tmp .env.release

echo "部署成功：$RELEASE_SHA"