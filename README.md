# skills

Agent skills collection by [mgalihpp](https://github.com/mgalihpp) — forked and reorganized from [cursor/plugins](https://github.com/cursor/plugins). Currently centered on **pstack**, poteto's rigorous engineering workflow for AI agents.

> If you want to go fast, go deep first. pstack helps you write less, but higher quality code — with fearless parallelism across subagents.

Original pstack by [Lauren Tan (poteto)](https://x.com/poteto) — see [`pstack/`](./pstack/).

## What's inside

```
skills/
├── pstack/          # pstack skills & agents (poteto-mode + 20+ skills, 21 principles)
│   ├── skills/      # poteto-mode, how, why, architect, tdd, unslop, etc.
│   ├── agents/      # poteto-agent, comment-sicko
│   └── LICENSE      # MIT © Lauren Tan (upstream)
├── README.md
└── LICENSE          # MIT © 2026 mgalihpp (this repo)
```

`pstack` is a Cursor/Claude/opencode/oh-my-pi compatible plugin. It ships `poteto-mode` (22 playbooks: bug-fix, feature, refactor, perf, prototype, etc.) plus situational skills and a strict subagent style.

## Install

**Cursor:**

```bash
/add-plugin pstack
```

Or clone this repo and copy skills where your harness discovers them (`.agents/skills` is universal):

```bash
git clone https://github.com/mgalihpp/skills.git
# project-local (portable, recommended)
cp -r skills/pstack/skills/* .agents/skills/
cp -r skills/pstack/agents/* .agents/agents/
# or user-global
cp -r skills/pstack/skills/* ~/.config/opencode/skills/
```

For `oh-my-pi`, `opencode`, or `Claude Code`, same `.agents/skills` path works — see [`pstack/README.md`](./pstack/README.md) for harness-specific notes.

## Get started

1. Run `/setup-pstack` — pick models per role (code/judgment/review).
2. Use `/poteto-mode` at the start of any non-trivial task — it picks a playbook and routes to the other skills for you.

Details and all 22 playbooks: [`pstack/skills/poteto-mode/SKILL.md`](./pstack/skills/poteto-mode/SKILL.md). Full guide: [`pstack/README.md`](./pstack/README.md).

## License

MIT — see [LICENSE](./LICENSE). `pstack/` upstream is MIT © 2026 Lauren Tan; this collection is MIT © 2026 mgalihpp.
