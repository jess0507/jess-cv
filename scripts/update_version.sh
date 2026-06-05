#!/bin/bash

# 從 git tag 更新 pubspec.yaml 的版本號
# 使用方式: ./scripts/update_version.sh

# 取得最新的 git tag
GIT_TAG=$(git describe --tags --abbrev=0 2>/dev/null)

if [ -z "$GIT_TAG" ]; then
    echo "⚠️  沒有找到 git tag，請先建立 tag"
    echo "建立 tag 範例: git tag 1.0.0"
    exit 1
fi

# 版本號直接使用 git tag (不加 v 前綴)
VERSION=$GIT_TAG

# 取得 commit 次數作為 commit number
COMMIT_NUMBER=$(git rev-list --count HEAD)

echo "📦 Git Tag: $GIT_TAG"
echo "🔢 Version: $VERSION"
echo "🔨 Commit Number: $COMMIT_NUMBER"

# 更新 pubspec.yaml
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/^version: .*/version: $VERSION/" pubspec.yaml
else
    # Linux
    sed -i "s/^version: .*/version: $VERSION/" pubspec.yaml
fi

echo "✅ 已更新 pubspec.yaml 的版本號為: $VERSION"
