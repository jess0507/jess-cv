#!/usr/bin/env python3
"""把多語系 CSV 轉成 Flutter gen_l10n 用的 .arb 檔。

CSV 來源(擇一):
  1. 共享的 Google Sheet(預設):需提供試算表的 file id 或分享連結
       DRIVE_FILE_ID=xxxxx python3 scripts/csv_to_arb.py
       python3 scripts/csv_to_arb.py --drive https://docs.google.com/spreadsheets/d/xxxxx/edit
  2. 本機檔案:
       python3 scripts/csv_to_arb.py --local assets/lang/translations.csv

CSV 格式(第一欄為 key,其餘每欄一個語言):
    key,en,zh
    home,Home,首頁
    ...

輸出:lib/l10n/app_<lang>.arb,例如 app_en.arb、app_zh.arb。
第一個語言欄會被當成 template(對應 l10n.yaml 的 template-arb-file)。
"""

import argparse
import csv
import io
import json
import os
import re
import sys
import urllib.request

# 專案根目錄(本檔位於 scripts/ 底下)
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUTPUT_DIR = os.path.join(ROOT, "lib", "l10n")
DEFAULT_LOCAL_CSV = os.path.join(ROOT, "assets", "lang", "translations.csv")

# Dart 保留字,不能直接當成 gen_l10n 產生的 getter 名稱
DART_RESERVED = {
    "abstract", "as", "assert", "async", "await", "break", "case", "catch",
    "class", "const", "continue", "covariant", "default", "deferred", "do",
    "dynamic", "else", "enum", "export", "extends", "extension", "external",
    "factory", "false", "final", "finally", "for", "function", "get", "hide",
    "if", "implements", "import", "in", "interface", "is", "late", "library",
    "mixin", "new", "null", "on", "operator", "part", "required", "rethrow",
    "return", "set", "show", "static", "super", "switch", "sync", "this",
    "throw", "true", "try", "typedef", "var", "void", "while", "with", "yield",
}


def sanitize_key(raw: str) -> str:
    """把 CSV 的 key 轉成合法的 Dart 識別字(gen_l10n getter 名稱)。"""
    # 去掉非 [A-Za-z0-9_] 的字元,例如 "emailLabel:" -> "emailLabel"
    key = re.sub(r"[^0-9A-Za-z_]", "", raw.strip())
    if not key:
        raise ValueError(f"無法將 key '{raw}' 轉成合法識別字")
    # 不能以數字開頭
    if key[0].isdigit():
        key = "k" + key
    # 保留字加上後綴,例如 "with" -> "withText"
    if key in DART_RESERVED:
        key = key + "Text"
    return key


def extract_drive_id(value: str) -> str:
    """從 file id 或各種 Google Drive 分享連結中取出 file id。"""
    m = re.search(r"/d/([A-Za-z0-9_-]+)", value)
    if m:
        return m.group(1)
    m = re.search(r"[?&]id=([A-Za-z0-9_-]+)", value)
    if m:
        return m.group(1)
    return value  # 視為已經是純 id


def fetch_csv_from_drive(file_ref: str) -> str:
    """從共享的 Google Sheet 匯出 CSV。"""
    file_id = extract_drive_id(file_ref)
    url = f"https://docs.google.com/spreadsheets/d/{file_id}/export?format=csv"
    print(f"從 Google Sheet 匯出 CSV(id={file_id})…")
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
    try:
        with urllib.request.urlopen(req) as resp:
            data = resp.read().decode("utf-8-sig")
    except urllib.error.HTTPError as e:
        sys.exit(
            f"匯出失敗(HTTP {e.code})。請確認試算表共用權限為"
            "『知道連結的任何人可檢視』,且 id 正確。"
        )
    if "<!doctype html" in data[:200].lower() or "<html" in data[:200].lower():
        sys.exit(
            "匯出到的是 HTML 而非 CSV。請把試算表共用權限設為"
            "『知道連結的任何人可檢視』。"
        )
    return data


def read_csv_text(args) -> str:
    drive_ref = args.drive or os.environ.get("DRIVE_FILE_ID")
    if args.local:
        path = args.local
        print(f"讀取本機 CSV:{path}")
        with open(path, encoding="utf-8-sig") as f:
            return f.read()
    if drive_ref:
        return fetch_csv_from_drive(drive_ref)
    # 都沒指定時,退回專案內的本機 CSV
    print(f"未提供 Drive 來源,改用本機預設:{DEFAULT_LOCAL_CSV}")
    with open(DEFAULT_LOCAL_CSV, encoding="utf-8-sig") as f:
        return f.read()


def main():
    parser = argparse.ArgumentParser(description="CSV 轉 ARB(Flutter gen_l10n)")
    parser.add_argument("--drive", help="Google Drive file id 或分享連結")
    parser.add_argument("--local", help="本機 CSV 路徑(優先於 Drive)")
    args = parser.parse_args()

    text = read_csv_text(args)
    reader = csv.reader(io.StringIO(text))
    rows = [r for r in reader if r and any(c.strip() for c in r)]
    if not rows:
        sys.exit("CSV 沒有任何資料列")

    header = rows[0]
    langs = [h.strip() for h in header[1:]]
    if not langs:
        sys.exit("CSV 標頭至少要有一個語言欄,例如:key,en,zh")

    # 每個語言一份 {key: value}
    tables = {lang: {} for lang in langs}
    for row in rows[1:]:
        raw_key = row[0].strip()
        if not raw_key:
            continue
        key = sanitize_key(raw_key)
        for i, lang in enumerate(langs, start=1):
            value = row[i] if i < len(row) else ""
            tables[lang][key] = value

    os.makedirs(OUTPUT_DIR, exist_ok=True)
    for lang in langs:
        arb = {"@@locale": lang}
        arb.update(tables[lang])
        out_path = os.path.join(OUTPUT_DIR, f"app_{lang}.arb")
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(arb, f, ensure_ascii=False, indent=2)
            f.write("\n")
        print(f"已輸出 {out_path}({len(tables[lang])} 筆)")

    print(f"\n模板語言(template-arb-file)= app_{langs[0]}.arb")
    print("接著執行:flutter gen-l10n")


if __name__ == "__main__":
    main()
