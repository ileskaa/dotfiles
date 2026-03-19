#!/usr/bin/env bash

# -type l: only symlinks
# -print0: outputs each result followed by a null byte instead of a newline
# IFS= diables word splitting
# read -r prevents backslashes from receiving special treatment
# -d '' tells read to use a null byte as the delimiter
# link is the variable that received each symlink path
find "$HOME" -maxdepth 3 -type l -print0 |
while IFS= read -r -d '' link; do
  target=$(readlink -f "$link") || continue
  case "$target" in
    "$HOME/dotfiles"/*) printf '%s -> %s\n' "$link" "$target" ;;
  esac
done
