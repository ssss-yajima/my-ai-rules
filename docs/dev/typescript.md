# TypeScript/JavaScript 開発ガイドライン

## アーキテクチャ設計

フロントエンド開発開始時には、要件に応じて適切なアーキテクチャを選定します：

- **SPA (Single Page Application)**: 高インタラクティブなアプリケーション
- **SSR (Server Side Rendering)**: SEO重視、初期表示速度重視
- **SSG (Static Site Generation)**: 静的コンテンツ中心
- **ハイブリッド**: 上記の組み合わせ

ホスティング時のランニングコストやスケーラビリティも考慮します。
選定後、このドキュメントを更新して詳細を記載してください。

## 技術スタック

| カテゴリ          | 技術                    | 用途                         |
| ----------------- | ----------------------- | ---------------------------- |
| Webフレームワーク | React (Vite) or Next.js | UIフレームワーク             |
| パッケージ管理    | pnpm                    | 高速・効率的な依存関係管理   |
| Lint/Format       | Biome.js                | コード品質管理               |
| ユニットテスト    | Vitest                  | 高速なテスト実行             |
| E2Eテスト         | Playwright              | ブラウザ自動テスト           |
| バリデーション    | Zod                     | 型安全なスキーマ検証         |
| フォーム管理      | React Hook Form         | 高性能フォーム処理           |
| 状態管理          | Zustand                 | シンプルな状態管理           |
| ORM               | Prisma                  | 型安全なデータベースアクセス |
| スタイリング      | Tailwind CSS            | ユーティリティファーストCSS  |
| UIコンポーネント  | Shadcn/UI               | カスタマイズ可能なUI         |
| アイコン          | Lucide React            | モダンなアイコンセット       |

### Biome.js 設定

- 設定ファイル（`biome.jsonc`）はプロジェクトルートに配置されているものを参考に設定すること
- 理由：VSCode拡張機能がプロジェクトルートの設定を参照するためルートにも配置している

## 開発環境構築

以下は一例なので、フレームワークや利用ライブラリに応じて変更してください

### Next.js プロジェクトの初期化

```bash
# Next.js プロジェクト作成
npx create-next-app@latest project_name \
  --ts \
  --tailwind \
  --src-dir \
  --eslint no \
  --use-pnpm \
  --disable-git \
  --app \
  --turbopack \
  --import-alias "@/*"

# 開発用依存関係の追加
pnpm add --save-dev --save-exact @biomejs/biome vitest

# Biome.js の初期化
pnpm biome init --jsonc
```

### 開発コマンド

```bash
# 開発サーバー起動
pnpm dev

# ビルド
pnpm build

# 本番モード起動
pnpm start

# Linting & Formatting
npx @biomejs/biome check --write ./src

# テスト実行
pnpm test

# E2Eテスト
pnpm e2e
```

## 品質保証

### Playwright MCP による動作確認

UI実装時は以下の項目を確認：

1. **表示確認**
   - レイアウトが意図通りか
   - レスポンシブデザインが機能しているか

2. **動作確認**
   - インタラクションが正しく動作するか
   - 状態管理が適切か

3. **エラー確認**
   - ブラウザコンソールにエラーが出ていないか
   - ネットワークエラーが発生していないか

## プロジェクト構造

```
project_name/
├── src/
│   ├── app/            # App Router (Next.js)
│   ├── components/     # UIコンポーネント
│   ├── lib/           # ユーティリティ関数
│   ├── hooks/         # カスタムフック
│   └── types/         # 型定義
├── public/            # 静的ファイル
├── tests/             # テストファイル
├── biome.jsonc        # Biome設定
├── tailwind.config.js # Tailwind設定
└── package.json       # プロジェクト設定
```

## ベストプラクティス

### コンポーネント設計
- 単一責任の原則を守る
- Props の型定義を明確にする
- 再利用可能なコンポーネントを作成

### パフォーマンス最適化
- 不要な再レンダリングを避ける
- 画像の最適化を行う
- コード分割を適切に実施

### アクセシビリティ
- セマンティックHTMLを使用
- ARIA属性を適切に設定
- キーボードナビゲーション対応
