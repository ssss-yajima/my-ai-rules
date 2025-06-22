# mise tasks チートシート

## 基本的な使い方

### タスクの実行
```bash
mise tasks              # 利用可能なタスクを一覧表示
mise run <task>         # タスクを実行
mise r <task>           # 短縮形
mise <task>             # 最短形（スクリプトでは非推奨）
mise run <task> -- args # タスクに引数を渡す
```

### タスクの定義方法

#### 1. mise.toml でのタスク定義
```toml
# シンプルなタスク
[tasks.build]
run = "pnpm build"
description = "アプリケーションをビルド"

# 複数コマンドの実行
[tasks.test]
run = [
  "pnpm lint",
  "pnpm type-check", 
  "pnpm test"
]

# エイリアス付きタスク
[tasks.dev]
run = "pnpm dev"
alias = "d"  # mise d で実行可能
```

#### 2. スクリプトファイルでのタスク定義
```bash
# .mise/tasks/deploy ファイル
#!/usr/bin/env bash
# mise description="本番環境へデプロイ"
echo "Deploying to production..."
```

## 高度な機能

### 依存関係
```toml
[tasks.ci]
depends = ["lint", "test", "build"]
description = "CI パイプライン"

[tasks.deploy]
depends = ["ci"]
run = "deploy.sh"
```

### ファイル変更検知
```toml
[tasks.build]
sources = ["src/**/*.ts", "package.json"]
outputs = ["dist/"]
run = "pnpm build"
```

### 環境変数
```toml
[tasks.test]
env = { NODE_ENV = "test", CI = "true" }
run = "pnpm test"
```

### 並列実行
```bash
mise run lint test build  # 3つのタスクを並列実行
mise run --jobs 2 task1 task2  # 最大2並列で実行
```

## タスクの整理パターン

### グループ化
```toml
[tasks."lint:eslint"]
run = "eslint ."

[tasks."lint:prettier"] 
run = "prettier --check ."

[tasks.lint]
depends = ["lint:*"]  # ワイルドカードで全サブタスクを実行
```

### 隠しタスク
```toml
[tasks._helper]
hide = true  # mise tasks で表示されない
run = "echo 'Helper task'"
```

## 実践的な例

### 開発環境セットアップ
```toml
[tasks.setup]
description = "開発環境を初期化"
run = [
  "mise install",
  "pnpm install",
  "cp .env.example .env",
  "echo '✅ セットアップ完了'"
]
```

### ビルド＆デプロイ
```toml
[tasks.build]
sources = ["src/**", "package.json"]
outputs = ["dist/"]
run = "pnpm build"

[tasks.deploy]
depends = ["build"]
confirm = "本番環境にデプロイしますか？"
run = "./scripts/deploy.sh"
```

### テスト実行
```toml
[tasks."test:unit"]
run = "vitest run"

[tasks."test:e2e"]
run = "playwright test"

[tasks.test]
depends = ["test:*"]
```

## Tips

### 1. デフォルトタスク
```toml
[tasks.default]
alias = ""  # mise run で実行される
run = "mise run dev"
```

### 2. インタラクティブな確認
```toml
[tasks.clean]
confirm = "すべてのビルド成果物を削除しますか？"
run = "rm -rf dist node_modules"
```

### 3. タスクの依存関係を確認
```bash
mise task deps test  # test タスクの依存関係をツリー表示
```

### 4. ウォッチモード
```bash
mise watch build  # ファイル変更を監視して自動実行
```

### 5. スクリプト言語の指定
```toml
[tasks.script]
run = '''
#!/usr/bin/env python
print("Python スクリプトも実行可能")
'''
```

## ベストプラクティス

1. **タスクの粒度**: 1タスク1責任を心がける
2. **命名規則**: 動詞で始める（build, test, deploy）
3. **グループ化**: 関連タスクは `:` で階層化
4. **説明文**: description を必ず記載
5. **依存関係**: depends で実行順序を明確化
6. **冪等性**: 何度実行しても同じ結果になるように