---
allowed-tools: Bash(mkdir:*), Write, Read
description: Create a new project-level custom command
argument-hint: <command-name>
---

# Create a Project Command

I'll help you create a new project-level custom command in `.claude/commands/`.

## Command Name: $ARGUMENTS

Based on the command name provided, I'll:

1. Create the appropriate directory structure if using namespacing (e.g., for `/category:command`, create `category/` subdirectory)
2. Create a Markdown file with the command definition
3. Include a template with:
   - YAML frontmatter (allowed-tools, description, argument-hint if needed)
   - Basic command structure
   - Placeholder for the command logic

Please provide:
- The command name (e.g., `optimize`, `review`, or `frontend:component` for namespaced commands)
- A brief description of what the command should do
- Any specific tools it needs access to
- Whether it should accept arguments

I'll create a well-structured command file that follows the Claude Code conventions.