Requirements:

- `stow` must be installed

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
