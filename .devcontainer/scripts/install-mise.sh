#!/bin/bash
set -e

echo "📦 Installing mise..."

# mise のインストール
if ! command -v mise &> /dev/null; then
    curl https://mise.run | sh
else
    echo "✓ mise is already installed"
fi

# mise の初期化
export PATH="$HOME/.local/bin:$PATH"
eval "$(mise activate bash)"

# プロジェクトディレクトリに移動してツールをインストール
cd /workspace
echo "🔧 Installing tools with mise..."
mise trust
mise install

echo "✅ mise setup completed!"