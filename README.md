# KTW Zeabur 管理工具

管理 Zeabur 雲端服務的工具集。

## 快速開始

```bash
cd /Users/ktw/ktw-projects/ktw-zeabur
./zeabur.sh status    # 查看服務狀態
```

## 服務總覽

| 服務                  | 類型        | 子網域                         | 自定義網域         |
| :-------------------- | :---------- | :----------------------------- | :----------------- |
| **ktw-saas-platform** | Payload CMS | `ktw-saas-platform.zeabur.app` | `www.ktwsmart.com` |
| **ktw-saas-bot**      | LINE Bot    | `ktw-saas-bot.zeabur.app`      | `bot.ktwsmart.com` |
| **postgresql**        | 資料庫      | -                              | -                  |

## 常用命令

### 查看狀態

```bash
./zeabur.sh status
```

### 查看日誌

```bash
./zeabur.sh logs platform      # Platform 日誌
./zeabur.sh logs bot           # Bot 日誌
./zeabur.sh logs-watch platform # 即時監控（Ctrl+C 停止）
```

### 重啟服務

```bash
./zeabur.sh restart platform
./zeabur.sh restart bot
```

## 專案資訊

| 項目        | 值                         |
| :---------- | :------------------------- |
| **專案 ID** | `69509a340d417f0c98434175` |
| **環境 ID** | `69509a343c33a611f1236d6c` |
| **區域**    | 日本東京 (`hnd1`)          |

## 服務 ID

| 服務       | ID                         |
| :--------- | :------------------------- |
| Platform   | `69509aa57ab28c100bbc0aa7` |
| Bot        | `69509ae97ab28c100bbc0abc` |
| PostgreSQL | `6950c2a2479879e7ecdb006c` |

## 原生 CLI 命令

如需更進階操作，可直接使用 Zeabur CLI：

```bash
# 登入狀態
npx zeabur auth status

# 列出專案
npx zeabur project list -i=false

# 服務詳情
npx zeabur service get --id 69509aa57ab28c100bbc0aa7 -i=false

# 環境變數
npx zeabur variable list -i=false
```

## 相關連結

- [Zeabur 控制台](https://zeabur.com/projects/69509a340d417f0c98434175)
- [Zeabur API 文檔](https://zeabur.com/docs/developer/public-api)
- [Platform 管理後台](https://www.ktwsmart.com/admin)

---

> 最後更新：2025-12-28
