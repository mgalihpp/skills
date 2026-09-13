#!/usr/bin/env bash
# sync-universal.sh — keep pstack skills/agents mirrored to every harness discovery path
# Run after editing skills/* or agents/*.
# Sources: skills/ and agents/ (canonical for Cursor)
# Dests: .agents/skills, .opencode/skills, .claude/skills, .omp/skills (+ agents)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo "sync pstack → universal harness paths"
for dest in .agents/skills .opencode/skills .claude/skills .omp/skills; do
  mkdir -p "$ROOT/$dest"
  # copy each top-level skill that has SKILL.md (flat discovery)
  for src in "$ROOT/skills"/*/; do
    [ -f "$src/SKILL.md" ] || continue
    name=$(basename "$src")
    rm -rf "$ROOT/$dest/$name"
    cp -r "$src" "$ROOT/$dest/$name"
  done
  echo "  $dest: $(ls -1 "$ROOT/$dest" | wc -l) skills"
done
for dest in .agents/agents .opencode/agents .claude/agents .omp/agents; do
  mkdir -p "$ROOT/$dest"
  cp -f "$ROOT/agents"/*.md "$ROOT/$dest/" 2>/dev/null || true
  echo "  $dest: $(ls -1 "$ROOT/$dest" 2>/dev/null | wc -l) agents"
done
echo "done. Validate: skills name == dir and regex ^[a-z0-9]+(-[a-z0-9]+)*$"
VALIDATION_ROOT="$ROOT"
if command -v cygpath >/dev/null 2>&1; then
  VALIDATION_ROOT="$(cygpath -w "$ROOT")"
fi
PSTACK_ROOT="$VALIDATION_ROOT" python3 -c '
import os, re
from pathlib import Path
root=Path(os.environ["PSTACK_ROOT"]) / "skills"
pat=re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
ok=True
for d in sorted(os.listdir(root)):
    f=root/d/"SKILL.md"
    if not f.exists(): print(f"MISSING: {d}"); ok=False; continue
    text=f.read_text(encoding="utf-8", errors="ignore")
    import re as re2
    m=re2.search(r"^name:\s*(.+)$", text, re.M)
    name=m.group(1).strip().strip(chr(34)).strip(chr(39)) if m else ""
    if not pat.match(name): print(f"INVALID: {d} => {name!r}"); ok=False
    if name!=d: print(f"MISMATCH: {d} => {name!r}"); ok=False
print("validate: OK" if ok else "validate: FAILED")
'
