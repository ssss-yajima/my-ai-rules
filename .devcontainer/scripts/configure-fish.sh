#!/bin/bash
set -e

echo "🐟 Configuring Fish shell..."

# Fish の設定ディレクトリを作成
mkdir -p ~/.config/fish

# 必要なツールの存在確認
echo "🔍 Checking required tools..."

if ! command -v eza &> /dev/null; then
    echo "❌ Error: eza is not installed. Please install it via mise or package manager."
    exit 1
fi

if ! command -v bat &> /dev/null; then
    echo "❌ Error: bat is not installed. Please install it via mise or package manager."
    exit 1
fi

echo "✅ All required tools are available"

# mise の自動アクティベーション
cat > ~/.config/fish/config.fish << 'EOF'
# mise activation
if test -f ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
end

# Git の安全なディレクトリ設定
git config --global --add safe.directory /workspace

# エイリアス (ツールの存在確認済み)
alias ll='eza -la'
alias la='eza -a'
alias tree='eza --tree'
alias cat='bat'

# プロジェクトディレクトリに自動移動
cd /workspace
EOF

# miseの補完設定
mise completion fish > ~/.config/fish/completions/mise.fish

echo "✅ Fish shell configured!"






==============================
TODO：これを作るところから
==============================
