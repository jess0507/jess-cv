#!/bin/bash

# Deploy to Firebase Hosting
# 使用方式: ./scripts/deploy_firebase.sh
source ~/.zshrc

echo "🚀 開始部署到 Firebase Hosting..."
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
    echo ""

    # 部署到 Firebase
    echo "🌐 部署到 Firebase Hosting..."
    firebase deploy --only hosting

    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 部署成功！"
        echo "✨ 你的應用已經上線了"
    else
        echo ""
        echo "❌ Firebase 部署失敗"
        exit 1
    fi
else
    echo ""
    echo "❌ 建置失敗"
    exit 1
fi