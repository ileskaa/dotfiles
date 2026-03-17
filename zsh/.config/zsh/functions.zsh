# Git File Edit
gfe() {
  local file
  file="$(
    {
      # Show files with unstaged changes
      git diff --name-only
      # Show files with staged changes
      git diff --cached --name-only
      # Show untracked files
      git ls-files --others --exclude-standard
    # -u means unique => duplicates are removed
    } | sort -u | fzf
  )" || return

  # Check if file is non-empty and if it is, open it in nvim
  [[ -n "$file" ]] && nvim "$file"
}

# Git File Untracked
gfu() {
  local file
  file="$(
    # List non-tracked files while respecting normal ignore rules
    git ls-files --others --exclude-standard | fzf
  )" || return

  [[ -n "$file" ]] && nvim "$file"
}

# Git File Stage
gfs() {
  local files
  files="$(
    {
      git diff --name-only
      git ls-files --others --exclude-standard
    } | sort -u | fzf --multi
  )" || return

  # Take selected filenames and feed them into `git add`
  [[ -n "$files" ]] && printf '%s\n' "$files" | xargs git add --
}

# Git File Diff
gfd() {
  local file
  file="$(
    {
      git diff --name-only
      git diff --cached --name-only
    } | sort -u | fzf
  )" || return

  [[ -n "$file" ]] && git diff "$file"
}

# Git File Restore
gfr() {
  local files
  files="$(
    git diff --name-only | fzf --multi
  )" || return

  [[ -n "$files" ]] && printf '%s\n' "$files" | xargs git restore --
}
