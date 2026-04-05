#!/usr/bin/env sh

set -eu

repo_root=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
source_file="$repo_root/ai-src/agent-instructions.md"

cp "$source_file" "$repo_root/ai/.codex/AGENTS.md"
cp "$source_file" "$repo_root/ai/.claude/CLAUDE.md"
