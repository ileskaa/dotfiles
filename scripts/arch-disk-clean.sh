#!/usr/bin/env bash
set -euo pipefail

# Arch-ish (invokes paccache) Linux cleanup helper for reclaiming disk space fast.

print_header() {
  printf "\n== %s ==\n" "$1"
}

run_cmd() {
  printf "\n$ %s\n" "$*"
  "$@"
}

exists() {
  command -v "$1" >/dev/null 2>&1
}

print_header "Disk usage before"
run_cmd df -h /

print_header "Top home directory hogs"
run_cmd du -xhd1 \
  "$HOME/.cache" \
  "$HOME/.local/share" \
  "$HOME/.docker" \
  "$HOME/.config" \
  "$HOME/.npm" \
  "$HOME/repos" 2>/dev/null | sort -h

print_header "1) Clear user caches"
for dir in \
  "$HOME/.cache/yay" \
  "$HOME/.cache/pip" \
  "$HOME/.cache/huggingface"
do
  if [[ -d "$dir" ]]; then
    echo "Clearing $dir"
    rm -rf "${dir:?}/"*
  fi
done

print_header "2) Clean npm cache"
if exists npm; then
  npm cache clean --force || true
fi

if [[ -d "$HOME/.npm/_npx" ]]; then
  echo "Removing ~/.npm/_npx"
  rm -rf "$HOME/.npm/_npx"/*
fi

print_header "3) Empty trash"
if [[ -d "$HOME/.local/share/Trash" ]]; then
  rm -rf "$HOME/.local/share/Trash/"*
fi

print_header "4) Prune pnpm store"
if exists pnpm; then
  pnpm store prune || true
fi

print_header "5) Clean pacman cache"
if exists paccache; then
  sudo paccache -rk2 || true
elif exists pacman; then
  echo "paccache not found, falling back to pacman -Sc"
  sudo pacman -Sc --noconfirm || true
fi

print_header "6) Vacuum journal logs"
if exists journalctl; then
  sudo journalctl --vacuum-time=7d || true
fi

print_header "7) Docker cleanup"
if exists docker; then
  docker system prune -af || true
  docker container prune -f || true
  docker volume prune -f || true
fi

print_header "8) Largest top-level directories in home"
du -xhd1 "$HOME" 2>/dev/null | sort -h | tail -20

print_header "Disk usage after"
run_cmd df -h /

print_header "Done"
echo "Review the repo artifact list above for optional manual cleanup."
