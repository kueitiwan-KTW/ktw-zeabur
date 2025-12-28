#!/bin/bash
# Zeabur 服務管理工具（使用官方 CLI）
# 使用方式：./zeabur.sh [命令] [服務]

# 服務 ID 對照
PLATFORM_ID="69509aa57ab28c100bbc0aa7"
BOT_ID="69509ae97ab28c100bbc0abc"
POSTGRESQL_ID="6950c2a2479879e7ecdb006c"

get_service_id() {
    case "$1" in
        platform) echo "$PLATFORM_ID" ;;
        bot) echo "$BOT_ID" ;;
        postgresql) echo "$POSTGRESQL_ID" ;;
        *) echo "" ;;
    esac
}

case "$1" in
    logs|log)
        service_id=$(get_service_id "$2")
        if [ -z "$service_id" ]; then
            echo "❌ 請指定服務：platform, bot, postgresql"
            exit 1
        fi
        echo "📋 查看 $2 的日誌..."
        npx zeabur deployment log --service-id "$service_id" -i=false
        ;;
    
    logs-watch|logw)
        service_id=$(get_service_id "$2")
        if [ -z "$service_id" ]; then
            echo "❌ 請指定服務：platform, bot, postgresql"
            exit 1
        fi
        echo "📋 即時監控 $2 的日誌（Ctrl+C 停止）..."
        npx zeabur deployment log --service-id "$service_id" -w -i=false
        ;;
    
    restart)
        service_id=$(get_service_id "$2")
        if [ -z "$service_id" ]; then
            echo "❌ 請指定服務：platform, bot, postgresql"
            exit 1
        fi
        echo "🔄 重啟 $2..."
        npx zeabur service restart --id "$service_id" -i=false
        ;;
    
    status|list)
        echo "📊 服務狀態："
        npx zeabur service list -i=false
        ;;
    
    *)
        echo "🔧 Zeabur 服務管理工具"
        echo ""
        echo "使用方式："
        echo "  ./zeabur.sh logs [服務]      - 查看日誌"
        echo "  ./zeabur.sh logs-watch [服務] - 即時監控日誌"
        echo "  ./zeabur.sh restart [服務]   - 重啟服務"
        echo "  ./zeabur.sh status           - 查看所有服務狀態"
        echo ""
        echo "服務：platform, bot, postgresql"
        ;;
esac
