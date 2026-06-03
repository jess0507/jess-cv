#!/usr/bin/env bash
# 從共享的 Google Sheet 下載多語系、轉成 ARB,並重新產生 AppLocalizations。
#
# 用法:
#   ./scripts/update_l10n.sh
set -euo pipefail

cd "$(dirname "$0")/.."

# 翻譯來源:共享的 Google Sheet(第一列為 key,en,zh)
DRIVE_FILE_ID="1iRGVSEhsocA_op_eMVIksnkPMkwvJ2jP0AABw-3a7YI"

# fvm 優先,沒裝就用系統 flutter
if command -v fvm >/dev/null 2>&1; then
  FLUTTER="fvm flutter"
else
  FLUTTER="flutter"
fi

echo "==> 從 Google Sheet 下載並轉換 → ARB"
python3 scripts/csv_to_arb.py --drive "$DRIVE_FILE_ID"

echo "==> 產生 AppLocalizations(flutter gen-l10n)"
$FLUTTER gen-l10n

echo "==> 完成"
