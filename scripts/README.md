# 開發腳本說明

## 可用的腳本

### 1. 建立 Git Tag
```bash
./scripts/create_tag.sh [version]
```
**範例：** `./scripts/create_tag.sh 1.0.0`

建立新的 git tag，版本號格式為 x.y.z

### 2. 更新版本號
```bash
./scripts/update_version.sh
```

從最新的 git tag 更新 `pubspec.yaml` 的版本號：
- 讀取最新的 git tag
- 使用 commit 數量作為 build number
- 自動更新 `pubspec.yaml`

### 3. 建置 Web
```bash
./scripts/build_web.sh
```

建置 Flutter Web 應用程式（Release 模式）：
- 清理舊的建置檔案
- 取得依賴套件
- 建置生產環境的 web 版本
- 輸出到 `build/web/`

### 4. 部署到 Firebase
```bash
./scripts/deploy_firebase.sh
```

自動建置並部署到 Firebase Hosting：
- 清理並建置 Web 版本
- 自動執行 `firebase deploy --only hosting`
- 一鍵完成建置和部署流程

### 5. 更新多語系（CSV → ARB）
翻譯維護在一份共享的 Google Sheet（第一列為 `key,en,zh`），更新後執行：

```bash
./scripts/update_l10n.sh
```

試算表的 file id 已寫死在 `scripts/update_l10n.sh`，固定從網路下載。

多語系流程：
- 翻譯來源是 Google Sheet（第一欄 `key`，其餘每欄一個語言，例如 `key,en,zh`）
- 試算表共用權限需設為「知道連結的任何人可檢視」
- `scripts/csv_to_arb.py` 以 `export?format=csv` 匯出，轉成 `lib/l10n/app_en.arb`、`lib/l10n/app_zh.arb`
  - key 會自動轉成合法的 Dart 識別字（`emailLabel:` → `emailLabel`、保留字 `with` → `withText`）
- `flutter gen-l10n` 依 `l10n.yaml` 產生 `lib/l10n/app_localizations.dart`
- 程式中以 `AppLocalizations.of(context).key` 取用；`l10nOf(context)` 為簡寫

新增語言：在 Sheet 加一欄（例如 `ja`）→ 跑 `update_l10n.sh` → 自動產生 `app_ja.arb` 與對應 locale。

## 版本號格式

- **Git Tag**: `v1.0.0`
- **pubspec.yaml**: `1.0.0+123` (123 是 build number)
- **App 顯示**: `v1.0.0`

## 工作流程範例

### 方式一：使用 deploy script（推薦）
```bash
# 1. 完成開發並提交
git add .
git commit -m "feat: 新功能"

# 2. 建立版本標籤
git tag v1.1.0

# 3. 更新版本號到 pubspec.yaml
./scripts/update_version.sh

# 4. 建置並部署到 Firebase（一鍵完成）
./scripts/deploy_firebase.sh

# 5. 推送到遠端
git push origin main
git push origin v1.1.0
```

### 方式二：手動步驟
```bash
# 1. 完成開發並提交
git add .
git commit -m "feat: 新功能"

# 2. 建立版本標籤
git tag v1.1.0

# 3. 更新版本號到 pubspec.yaml
./scripts/update_version.sh

# 4. 建置應用程式
./scripts/build_web.sh

# 5. 部署到 Firebase
firebase deploy --only hosting

# 6. 推送到遠端
git push origin main
git push origin v1.1.0
```

## 語義化版本建議

- `v1.0.0` → `v1.0.1`: Bug 修正
- `v1.0.0` → `v1.1.0`: 新功能（向下相容）
- `v1.0.0` → `v2.0.0`: 重大變更（不向下相容）
