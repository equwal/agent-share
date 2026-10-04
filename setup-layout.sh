#!/bin/sh
# Create the agent folder layout in a mounted 9P store.
# Usage: AGENTFS=/mnt/agentfs AGENTS="claude codex copilot antigravity" ./setup-layout.sh
set -eu
: "${AGENTFS:?set AGENTFS to the mount point}"
AGENTS=${AGENTS:-"claude codex copilot antigravity"}
mkdir -p "$AGENTFS/shared" "$AGENTFS/handoff"
for a in $AGENTS; do mkdir -p "$AGENTFS/scratch/$a" "$AGENTFS/inbox/$a"; done
cp "$(dirname "$0")/RULES.md" "$AGENTFS/RULES.md"
ls -R "$AGENTFS"
