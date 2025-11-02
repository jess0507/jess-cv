#!/bin/bash

# Build Flutter Web Application
# 使用方式: ./scripts/build_web.sh
source ~/.zshrc

echo "🚀 開始建置 Flutter Web..."
echo ""

# 清理之前的建置
echo "🧹 清理舊的建置檔案..."
flutter clean

# 取得依賴
echo "📦 取得依賴套件..."
flutter pub get

# 建置 Web (Release 模式)
echo "🔨 建置 Web (Release 模式)..."
flutter build web --release

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 建置完成！"
    echo "📁 輸出目錄: build/web"
    echo ""
    echo "下一步："
    echo "1. 執行 firebase deploy --only hosting 部署到 Firebase"
    echo "2. 或使用 IntelliJ 的 'Deploy to Firebase' configuration"
else
    echo ""
    echo "❌ 建置失敗"
    exit 1
fi
