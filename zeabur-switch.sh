#!/bin/bash
# ============================================================
# 檔案：zeabur-switch.sh
# 用途：Zeabur Context 快速切換腳本（Context Switcher，服務切換器）
#
# 功能：
#   - 快速切換 Zeabur CLI 的 project/env/service context
#   - 支援 platform、bot、db 三個服務
#
# 使用方式：
#   source ~/ktw-projects/ktw-zeabur/zeabur-switch.sh <platform|bot|db>
#
# 關聯：
#   - 依賴：npx zeabur CLI
#   - 位置：ktw-zeabur/zeabur-switch.sh
# ============================================================

PROJECT_ID="69509a340d417f0c98434175"
ENV_ID="69509a343c33a611f1236d6c"

PLATFORM_ID="69509aa57ab28c100bbc0aa7"
BOT_ID="69509ae97ab28c100bbc0abc"
DB_ID="6950c2a2479879e7ecdb006c"

case "$1" in
  platform|p)
    echo "🔄 切換到 ktw-saas-platform..."
    npx zeabur context set project --id=$PROJECT_ID -y
    npx zeabur context set env --id=$ENV_ID -y
    npx zeabur context set service --id=$PLATFORM_ID -y
    echo "✅ 已切換到 ktw-saas-platform"
    ;;
  bot|b)
    echo "🔄 切換到 ktw-saas-bot..."
    npx zeabur context set project --id=$PROJECT_ID -y
    npx zeabur context set env --id=$ENV_ID -y
    npx zeabur context set service --id=$BOT_ID -y
    echo "✅ 已切換到 ktw-saas-bot"
    ;;
  db|d)
    echo "🔄 切換到 postgresql..."
    npx zeabur context set project --id=$PROJECT_ID -y
    npx zeabur context set env --id=$ENV_ID -y
    npx zeabur context set service --id=$DB_ID -y
    echo "✅ 已切換到 postgresql"
    ;;
  status|s)
    npx zeabur context get
    ;;
  *)
    echo "Zeabur 服務切換器"
    echo ""
    echo "用法: source zeabur-switch.sh <選項>"
    echo ""
    echo "選項:"
    echo "  platform, p  - 切換到 ktw-saas-platform"
    echo "  bot, b       - 切換到 ktw-saas-bot"
    echo "  db, d        - 切換到 postgresql"
    echo "  status, s    - 查看當前 context"
    echo ""
    echo "服務 ID 對照:"
    echo "  ktw-saas-platform: $PLATFORM_ID"
    echo "  ktw-saas-bot:      $BOT_ID"
    echo "  postgresql:        $DB_ID"
    ;;
esac
