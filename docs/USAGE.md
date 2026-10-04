# agent-share

A shared file store for AI coding agents, on top of a 9P server
(see equwal/9p-store). Agents read and write plain files on a mount.

## Setup

1. Run a 9P server and mount it on each machine at the same path, for
   example `/mnt/agentfs`. Set `AGENTFS` to that path.
2. Create the layout once: `AGENTFS=/mnt/agentfs ./setup-layout.sh`.
3. Append `clients/instructions-snippet.md` to each agent's instruction file:

| Agent | File |
|---|---|
| Claude Code | `~/.claude/CLAUDE.md` |
| Codex | `~/.codex/AGENTS.md` |
| Copilot CLI | `~/.copilot/copilot-instructions.md` |
| Antigravity | `~/.gemini/GEMINI.md` |

4. Make sure `AGENTFS` is set in the agent's environment, or replace
   `$AGENTFS` in the snippet with the mount path.

On a machine with no 9P mount (for example Windows), agents can use the
plan9port `9p` CLI or ask an agent on a Linux host.

## Example brief section

```markdown
## agentfs
- Path: $AGENTFS (9P mount). Rules: $AGENTFS/RULES.md.
- Read: `cat $AGENTFS/shared/notes.md`. Write: write `x.tmp`, then `mv x.tmp x`.
- Use for scratch and handoff files between agents. Never secrets.
```
