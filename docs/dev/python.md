# Python 開発ガイドライン

## 技術スタック

| カテゴリ          | 技術              | バージョン |
| ----------------- | ----------------- | ---------- |
| 言語              | Python            | 3.13       |
| Webフレームワーク | FastAPI           | 最新       |
| CLIフレームワーク | Typer             | 最新       |
| パッケージ管理    | uv                | 最新       |
| Lint/Format       | Ruff              | 最新       |
| テスティング      | pytest            | 最新       |
| 型チェック        | pyright           | 最新       |
| モデル定義        | Pydantic          | 最新       |
| 環境設定管理      | Pydantic-Settings | 最新       |

## 環境構築

### プロジェクト初期化

```bash
# プロジェクトの初期化
uv init --name project_name --python 3.13

# 基本的な依存関係の追加
uv add pydantic pydantic-settings

# 開発用依存関係の追加
uv add --dev ruff pytest pyright pytest-cov
```

### 開発コマンド

#### コード実行
```bash
# スクリプトの実行
uv run python entry_point.py

# モジュールとして実行
uv run python -m entry.module
```

#### コード品質管理
```bash
# Linting（自動修正付き）
uv run ruff check --fix --unsafe-fixes

# フォーマット
uv run ruff format

# 型チェック
uv run pyright
```

#### テスト実行
```bash
# テスト実行（詳細表示・カバレッジ付き）
uv run pytest -v --cov

# 特定のテストのみ実行
uv run pytest tests/test_specific.py
```

## プロジェクト構造

```
project_name/
├── pyproject.toml       # プロジェクト設定
├── .env                # 環境変数（gitignore対象）
├── src/
│   └── project_name/
│       ├── __init__.py
│       ├── main.py     # エントリーポイント
│       ├── config/     # 設定管理
│       ├── models/     # Pydanticモデル
│       └── services/   # ビジネスロジック
└── tests/              # テストコード
    ├── __init__.py
    └── unit/
        └── test_*.py
```

## ベストプラクティス

### 型ヒント
- 原則としてすべての関数に型ヒントを付ける
- 複雑な型は `typing` モジュールを活用
- Pydantic モデルで入出力を明確化

### エラーハンドリング
- 適切な例外クラスの使用
- エラーメッセージは具体的に
- ログ出力の活用

### 設定管理
- 環境変数は Pydantic-Settings で管理
- シークレット情報は `.env` ファイルに記載
- デフォルト値の適切な設定
