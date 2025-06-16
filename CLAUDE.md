# CLAUDE.md

作業を進めるときは @.claude/todos フォルダに TODOチェックリストを作って、更新しながら作業をしてください。


This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains custom Cursor rules for AI-driven system design and development based on USDM (Universal Specification Describing Manner) with acceptance tests using Gherkin syntax. The project aims to establish a structured workflow for requirements management, specification, and testing.

## Repository Structure

```
.
├── README.md
├── Taskfile.yml               # Task runner configuration
├── biome.jsonc                # Biome.js configuration for linting/formatting
└── docs/
    ├── adr/                   # Architecture Decision Records
    ├── designdoc.md           # System specification document
    ├── feature/               # Gherkin feature files (.feature)
    ├── requirements/          # USDM Requirements files (.yaml)
```

## Development Process

The project follows a structured development process:

1. **Requirements Definition (USDM)**:
   - Define requirements in YAML format following the USDM structure
   - Use REQ-XXX format for requirements and SPEC-XXX-YY for specifications
   - Follow the schema defined in usdm-schema.json

2. **Acceptance Tests (Gherkin)**:
   - Create feature files with Gherkin syntax for acceptance criteria
   - Use @USDM tags to link scenarios to specifications
   - Follow the template in feature_template.feature

3. **Work Planning**:
   - Use todo.md to create hierarchical task lists
   - Update task progress as work is completed

4. **Implementation**:
   - Follow TDD principles (write tests first)
   - Implement code according to specifications
   - Focus on testing key functionality rather than aiming for 100% coverage

## Technology Stack

### Python
- Web Framework: FastAPI
- CLI Framework: Typer
- Package Management: uv
- Lint/Format: Ruff
- Testing: pytest
- Type Checking: Typing
- Model Definition: Pydantic
- Environment/Configuration: Pydantic-Settings

### TypeScript
- Web Framework: React or Next.js
- Package Management: pnpm
- Lint/Format: Biome.js
- Testing: Vitest
- Validation: Zod

## Security - secretlint設定

### 概要

secretlintとpre-commit hookにより秘密情報の誤コミットを防止します。

### セットアップ

```bash
# 依存関係インストールとhookセットアップ
task setup-hooks

# または手動で
pnpm install
chmod +x .husky/pre-commit
```

### 使用方法

```bash
# 秘密情報チェック実行
task secretlint

# 修正可能な問題を自動修正
task secretlint:fix

# 個別実行
pnpm secretlint "**/*"
pnpm secretlint:fix "**/*"
```

### 設定ファイル

- `.secretlintrc.json`: secretlint設定
- `.husky/pre-commit`: pre-commitフック
- `package.json`: 依存関係とスクリプト定義

### 検出対象

- AWS系認証情報（Access Key, Secret Key, ARN等）
- GitHub Token
- API Key汎用パターン
- JWT Token
- プライベートキー（RSA, SSH等）
- Basic認証情報

## Commands

### Task Runner

```bash
# List available tasks
task list

# Run default task
task
```

### Python Development

```bash
# Initialize project
uv init --name project_name --python 3.12

# Add dependencies
uv add pydantic pydantic-settings
uv add --dev ruff pytest pyright pytest-cov

# Run Python code
uv run python entry_point.py
uv run python -m entry.module

# Linting and formatting
uv run ruff check --fix --unsafe-fixes
uv run ruff format

# Run tests
uv run pytest -v --cov
```

### TypeScript Development

```bash
# Project setup (Next.js)
npx create-next-app@latest project_name --ts --tailwind --src-dir --eslint no --use-pnpm --disable-git --app --turbopack --import-alias "@/*"

pnpm add --save-dev --save-exact @biomejs/biome vitest

pnpm biome init --jsonc

# Linting and formatting
npx @biomejs/biome check --write ./src
```
