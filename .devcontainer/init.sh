#!/bin/bash
set -e

echo "🚀 Initializing development environment..."

# スクリプトのベースディレクトリ
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts"

# 各スクリプトを順番に実行
bash "$SCRIPT_DIR/install-mise.sh"
bash "$SCRIPT_DIR/configure-fish.sh"

# プロジェクトのセットアップ
mise run setup

echo "✅ Development environment initialized!"
echo "💡 Run 'fish' to start using the configured shell"
