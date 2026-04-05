## AI

The following is a good line to put to your `~/.codex/config.toml`:

```bash
project_doc_fallback_filenames = ["AGENTS.local.md"]
```

That file is however kept out of version control (i.e. not stowed) because codex will write to it based on user decisions.

`agent-instructions.md` is the source of truth for both:

- `ai/.codex/AGENTS.md`
- `ai/.claude/CLAUDE.md`

Regenerate those files with:

```bash
./ai-src/generate.sh
```
