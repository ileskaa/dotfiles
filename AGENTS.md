# Repository Guidelines

## Project Structure & Module Organization

This repository is a GNU Stow-managed dotfiles repo. Each top-level directory is a stow package that maps into `$HOME`.

- `ai/`: stowed Codex and agent-related config under `.codex/` and `.claude/`.
- `ai-src/`: repo-only source material and generation scripts for agent instructions.
- `nvim/`: Neovim config under `.config/nvim/`, mostly Lua.
- `sway/`: Sway window manager config under `.config/sway/`.
- `wezterm/`: WezTerm config in `.wezterm.lua`.
- `zsh/`: Zsh startup files and shell functions.

Keep changes local to the package you are updating. Do not mix unrelated refactors with behavior changes.

## Build, Test, and Development Commands

There is no single project-wide build. Use Stow and targeted smoke checks.

- `stow -nv -R nvim`: dry-run restow for one package.
- `stow -Rv zsh`: apply symlink updates for one package.
- `zsh -n zsh/.zshrc`: syntax-check shell changes.
- `nvim --headless "+qa"`: verify Neovim config starts cleanly.
- `git diff --check`: catch whitespace and merge-marker issues before committing.

Run commands from the repository root. Prefer the narrowest validation that matches the files you changed.

## Coding Style & Naming Conventions

Follow existing file-local patterns. Keep diffs minimal.

- Lua uses 2-space indentation; see `nvim/.config/nvim/.stylua.toml`.
- Existing Lua style favors concise module files such as `options.lua`, `mappings.lua`, and `commands.lua`.
- Shell files should stay POSIX/Zsh-friendly and readable; prefer descriptive function names in `zsh/.config/zsh/functions.zsh`.
- Use lowercase, tool-oriented package names and keep new files near the config they affect.

## Testing Guidelines

This repo does not have a central automated test suite. Validate by loading the affected tool or running a targeted syntax/smoke check.

- For `zsh/`, run `zsh -n`.
- For `nvim/`, use a headless startup check.
- For Stow changes, use `stow -nv -R <package>` before applying.

Document any skipped verification in your change notes.

## Commit & Pull Request Guidelines

Recent commits use short, imperative subjects, often lowercase, with an optional scope prefix such as `nvim:` or `readme:`. Examples: `add AI README`, `nvim: add command to display path of current file + copy it to clipboard`.

Pull requests should include:

- a brief summary of the user-visible config change
- the affected package paths, such as `nvim/` or `zsh/`
- the verification commands you ran
- screenshots only when changing visible UI behavior, such as Sway or WezTerm

## Security & Local Configuration

Do not commit machine-specific secrets or personal overrides. Keep local-only agent notes outside version control, as described in `ai-src/README.md` for `AGENTS.local.md`.
