# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

{write here}


---

### 📋 タスク管理

#### リアルタイム管理（TodoWriteツール）
- **目的**: 作業中のタスク管理と進捗追跡
- **状態**: pending → in_progress → completed
- **優先度**: high / medium / low
- **ルール**:
  - 作業開始時に必ず`in_progress`に更新
  - 完了時は即座に`completed`に更新
  - 適切に分割されたタスクは複数並列実行可能

#### ファイルとしてのタスク管理

```
docs/
├── todos/
│   ├── todo.md           # プロジェクト全体状況のチェックリスト
│   ├── {task title}.md   # 各タスクの詳細な計画
├── archive/
│   └── *.md              # 完了したタスクやドキュメントの置場
```

**重要**: 大きな作業の完了時は必ず`todo.md`や`{task title}.md`を更新すること。
タスクが完了した場合 `{task title}.md`を`archive/`に移動すること。



## 開発原則

開発の基本原則とガイドラインは以下のドキュメントを参照。
技術選定が完了したタイミングで、各ドキュメントを更新すること。

- **共通開発ガイドライン**: @docs/dev/common.md
- **Python開発**: @docs/dev/python.md
- **TypeScript/JavaScript開発**: @docs/dev/typescript.md

### 開発コマンド

主要なタスクコマンドは @Taskfile.yaml で定義されています。


### コード品質

コード品質管理の詳細は @docs/dev/common.md#コード品質管理 を参照


### 🔄 基本的な作業フロー


2. **ブランチ戦略**
   ```bash
   # 新機能開発
   git switch -c feature/機能名
   
   # バグ修正
   git switch -c fix/問題名
   
   # リファクタリング
   git switch -c refactor/対象名
   ```

3. **実装フロー**
   - 小さな単位で段階的に実装
   - 各ステップでコミット（意味のある単位で）

5. **コミット・プルリクエスト**
   ```bash
   # 適切なファイルのみをステージング
   git add src/components/VideoTile.tsx
   git add src/lib/localStorage.ts
   # または対話的に選択
   git add -p
   
   # 意味のある単位でコミット
   git commit -m "feat: 機能説明
   
   - 実装内容の詳細
   - 技術的な判断理由
   
   🤖 Generated with Claude Code
   
   Co-Authored-By: Claude <noreply@anthropic.com>"
   
   # プルリクエスト作成
   git push origin feature/機能名
   gh pr create --title "feat: 機能名" --body "説明"
   ```


==================================================================

以下、プロジェクト固有情報

==================================================================

