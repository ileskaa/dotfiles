# Repository Guidelines

## Project Structure & Module Organization

This package is a GNU Stow target for Neovim config under `.config/nvim/`. Keep changes scoped to this package.

- `./.config/nvim/init.lua`: bootstrap, plugin setup, and module loading.
- `./.config/nvim/lua/`: main Lua modules such as `options.lua`, `mappings.lua`, `commands.lua`, and `autocmds.lua`.
- `./.config/nvim/lua/configs/`: plugin-specific config, for example `lspconfig.lua` and `conform.lua`.
- `./.config/nvim/lua/plugins/init.lua`: Lazy plugin specs and overrides.
- `./.config/nvim/after/ftplugin/`: filetype-specific Vimscript tweaks.
- `./.config/nvim/lazy-lock.json`: pinned plugin versions managed by Lazy.

## Build, Test, and Development Commands

Run commands from the repository root unless a task clearly targets this package only.

- `stow -nv -R nvim`: dry-run restow for the Neovim package.
- `nvim --headless "+qa"`: smoke-test startup for config errors.
- `git diff --check`: catch whitespace issues and merge markers.
- `stylua .config/nvim`: format Lua files using the repo config in `.config/nvim/.stylua.toml`.

## Coding Style & Naming Conventions

Follow the existing NvChad-style layout and keep diffs minimal.

- Use 2-space indentation in Lua.
- Respect `.config/nvim/.stylua.toml` settings such as 120-column width and double-quote preference.
- Keep module names short and descriptive: `options.lua`, `commands.lua`, `configs/<plugin>.lua`.
- Prefer extending existing plugin specs or config modules over creating parallel patterns.

## Testing Guidelines

There is no dedicated test suite for this package. Validate the narrowest relevant behavior.

- Run `nvim --headless "+qa"` after any config change.
- If you touch Stow-relevant paths, also run `stow -nv -R nvim`.
- When changing filetype behavior, verify the affected filetype manually in Neovim.

## Commit & Pull Request Guidelines

Recent commits favor short, imperative subjects, often with an `nvim:` prefix, for example `nvim: add command to display path of current file + copy it to clipboard`.

- Keep commits focused on one behavior change.
- In PRs, summarize the user-visible config change, list affected paths under `nvim/`, and include verification commands run.
- Add screenshots only for visible UI changes.

## Security & Local Configuration

Do not commit machine-specific paths, secrets, or personal overrides. Keep local-only notes outside version control, and avoid changing unrelated dotfile packages in the same diff.
