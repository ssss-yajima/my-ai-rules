# mise と DevContainer ガイド

## 概要
このプロジェクトでは、開発環境の管理に mise と DevContainer を使用します。

- **mise**: ローカル開発環境でのツール管理
- **DevContainer**: 統一された開発環境の提供

## mise の使い方

### 初期セットアップ
```bash
# mise のインストール (まだの場合)
curl https://mise.run | sh

# 設定ファイルを信頼
mise trust

# ツールのインストール
mise install

# インストール済みツールの確認
mise ls
```

### ローカル環境設定
```bash
# テンプレートをコピー
cp mise.local.toml.example mise.local.toml

# mise.local.toml を編集して環境変数を設定
# (mise.local.toml は gitignore されています)
```

### よく使うコマンド
```bash
# ツールのアップデート
mise upgrade

# 特定のツールをインストール
mise install node@20

# 環境変数の確認
mise env

# タスクの実行
mise run setup
mise run dev
mise run test
```

## DevContainer の使い方

### 前提条件
- Docker Desktop がインストールされていること
- VS Code と Dev Containers 拡張機能がインストールされていること

### DevContainer の起動
1. VS Code でプロジェクトを開く
2. コマンドパレット（Cmd/Ctrl + Shift + P）を開く
3. "Dev Containers: Reopen in Container" を選択

### 特徴
- **自動セットアップ**: コンテナ起動時に mise と全ツールが自動インストール
- **設定の引き継ぎ**: ローカルの AWS、SSH、Git 設定を自動で引き継ぎ
- **履歴の永続化**: シェル履歴が保存される
- **ボリューム永続化**: node_modules や Python 環境が保持される

### カスタマイズ
必要に応じて以下のファイルを編集：
- `.devcontainer/devcontainer.json`: VS Code 設定、拡張機能
- `.devcontainer/docker-compose.yml`: ボリューム、環境変数
- `.devcontainer/init.sh`: 初期化処理

## 推奨ワークフロー

### ローカル開発
```bash
# プロジェクトをクローン
git clone <repository>
cd <project>

# mise でツールをインストール
mise trust
mise install

# 開発開始
mise run dev
```

### DevContainer 開発
1. VS Code で "Reopen in Container"
2. 自動的に全ての環境が構築される
3. ターミナルで開発コマンドを実行

## トラブルシューティング

### mise 関連
- `mise: command not found`: インストールスクリプトを再実行
- `not trusted`: `mise trust` を実行
- ツールが見つからない: `mise doctor` で診断

### DevContainer 関連
- コンテナが起動しない: Docker Desktop が起動しているか確認
- 拡張機能が動作しない: devcontainer.json の extensions を確認
- パフォーマンスが遅い: docker-compose.yml のボリュームマウントを調整

## ベストプラクティス
1. **mise.toml**: プロジェクト共通の設定のみ記載
2. **mise.local.toml**: 個人の環境変数（API キーなど）を記載
3. **DevContainer**: チーム開発時は積極的に使用
4. **ツールバージョン**: 可能な限り具体的なバージョンを指定