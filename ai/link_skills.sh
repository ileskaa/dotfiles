#!/usr/bin/env bash
set -euo pipefail

# Does nothing if the dirs already exists
mkdir -p "$HOME/.claude" "$HOME/.codex"

# -s: create symlink
# -f: replace existing destination
# -n: treat existing symlink as a normal file target
ln -sfn "$HOME/dotfiles/ai/skills" "$HOME/.claude/skills"
ln -sfn "$HOME/dotfiles/ai/skills" "$HOME/.codex/skills"

echo "Done:"
# -d: list the directory entry itself, not its content
ls -ld "$HOME/.claude/skills" "$HOME/.codex/skills"
