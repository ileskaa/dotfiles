Requirements:

- `stow` must be installed

## GNU Stow

GNU Stow is a symlink farm manager. And it's pretty badass.

By default stow targets the parent of the stow dir.
That parent dir is hence often referred to as the target dir.

The stow dir is the dir you are running the command from, unless it is overriden with flags.

Use `stow --adopt` to take over an existing real file in the target directory.

You can also do a dry-run. For example:

```bash
# -n: no-op / dry run
# -v: verbose
# -R: restow => unstow, then stow again
stow -nv -R ai
```

## AI layout

The `ai/` package is reserved for files that should be stowed into `$HOME`.

- `ai/.codex/` contains Codex-facing config, generated instruction files, and shared skills.
- `ai/.claude/` contains Claude-facing generated files and symlinks.
- `ai-src/` contains repo-only source material and generation logic. It is not a stow package.

Regenerate the tool-facing instruction files with:

```bash
./ai-src/generate.sh
```

## Symlinks

`ln -s` allows you to create symbolic links. Example:

```bash
ln -s ../.codex/skills ai/.claude/skills
```

where `../.codex/skills` is the target of the symlink
and `ai/.claude/skills` is the path of the symlink being created.
Note that the target is resolved relative to the symlink path (the 2nd argument).
