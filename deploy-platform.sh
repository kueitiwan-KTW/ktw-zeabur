#!/bin/bash
# Zeabur 部署健康檢查腳本
# 使用方式：./deploy-platform.sh

set -e

SERVICE_ID="69509aa57ab28c100bbc0aa7"
PLATFORM_URL="https://ktw-saas-platform.zeabur.app/admin"
MAX_RETRIES=5
RETRY_DELAY=30

echo "🚀 開始部署 ktw-saas-platform..."

# 1. 部署
echo "📦 上傳程式碼到 Zeabur..."
cd /Users/ktw/ktw-projects/ktw-saas-platform
npx zeabur deploy --service-id "$SERVICE_ID" -i=false

# 2. 重啟
echo "🔄 重啟服務..."
cd /Users/ktw/ktw-projects/ktw-zeabur
./zeabur.sh restart platform

# 3. 等待並檢查
echo "⏳ 等待服務啟動..."
sleep 60

# 4. 健康檢查
echo "🏥 執行健康檢查..."
for i in $(seq 1 $MAX_RETRIES); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$PLATFORM_URL")
    
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "✅ 服務正常運作 (HTTP $HTTP_CODE)"
        echo "🔗 訪問: $PLATFORM_URL"
        exit 0
    else
        echo "⚠️  嘗試 $i/$MAX_RETRIES: HTTP $HTTP_CODE"
        if [ $i -lt $MAX_RETRIES ]; then
            echo "   等待 ${RETRY_DELAY}s 後重試..."
            sleep $RETRY_DELAY
            # 嘗試重啟
            ./zeabur.sh restart platform
            sleep 30
        fi
    fi
done

echo "❌ 健康檢查失敗！請手動檢查日誌："
echo "   ./zeabur.sh logs platform"
exit 1
