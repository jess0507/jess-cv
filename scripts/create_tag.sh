#!/bin/bash

# 建立新的 Git Tag
# 使用方式: ./scripts/create_tag.sh [version]
# 範例: ./scripts/create_tag.sh 1.0.0

VERSION=$1

# 若沒有輸入參數，改為互動模式
if [ -z "$VERSION" ]; then
  echo -n "請輸入版本號 (例如 1.0.0): "
  read VERSION
fi

# 確保版本號格式正確
if [[ ! $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "⚠️  版本號格式錯誤，應為: x.y.z (例如: 1.0.0)"
    exit 1
fi

TAG="$VERSION"

# 檢查 tag 是否已存在
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo "⚠️  Tag $TAG 已經存在"
    exit 1
fi

echo "🏷️  建立 Git Tag: $TAG"

# 建立 tag
git tag -a "$TAG" -m "Release $TAG"

echo "✅ Tag $TAG 已建立"
echo ""
echo "下一步："
echo "1. 執行 ./scripts/update_version.sh 更新版本號"
echo "2. 執行 git push origin $TAG 推送 tag 到遠端"
