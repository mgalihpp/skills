# skills

Agent skills collection by [mgalihpp](https://github.com/mgalihpp) — forked and reorganized from [cursor/plugins](https://github.com/cursor/plugins). Currently centered on **pstack**, poteto's rigorous engineering workflow for AI agents.

> If you want to go fast, go deep first. pstack helps you write less, but higher quality code — with fearless parallelism across subagents.

Original pstack by [Lauren Tan (poteto)](https://x.com/poteto) — see [`pstack/`](./pstack/).

## What's inside

```
├── pstack/          # pstack — poteto's rigorous workflow (poteto-mode + 20+ skills, 21 principles)
│   ├── skills/      # poteto-mode, how, why, architect, tdd, unslop, etc.
│   ├── agents/      # poteto-agent, comment-sicko
│   └── LICENSE      # MIT © Lauren Tan (upstream)
├── superpowers/     # superpowers — obra's composable methodology (14 skills)
│   ├── skills/      # brainstorming, tdd, systematic-debugging, writing-plans, etc.
│   └── LICENSE      # MIT © Jesse Vincent (upstream)
└── README.md
```

`pstack` is a Cursor/Claude/opencode/oh-my-pi compatible plugin. It ships `poteto-mode` (22 playbooks: bug-fix, feature, refactor, perf, prototype, etc.) plus situational skills and a strict subagent style.

`superpowers` is [obra/superpowers](https://github.com/obra/superpowers) v6.3.0 — a complete development methodology built on composable skills. See [`superpowers/`](./superpowers/) and [`superpowers/README.md`](./superpowers/README.md).

## Install

**Cursor:**

```bash
/add-plugin pstack
/add-plugin superpowers
```

Or clone this repo and copy skills where your harness discovers them (`.agents/skills` is universal):

```bash
git clone https://github.com/mgalihpp/skills.git
# project-local (portable, recommended)
cp -r pstack/skills/* .agents/skills/
cp -r pstack/agents/* .agents/agents/
cp -r superpowers/skills/* .agents/skills/
# or user-global
cp -r pstack/skills/* ~/.config/opencode/skills/
cp -r superpowers/skills/* ~/.config/opencode/skills/
```

For `oh-my-pi`, `opencode`, or `Claude Code`, same `.agents/skills` path works — see [`pstack/README.md`](./pstack/README.md) and [`superpowers/README.md`](./superpowers/README.md) for harness-specific notes.

## Get started

1. Run `/setup-pstack` — pick models per role (code/judgment/review).
2. Use `/poteto-mode` at the start of any non-trivial task — it picks a playbook and routes to the other skills for you.

Details and all 22 playbooks: [`pstack/skills/poteto-mode/SKILL.md`](./pstack/skills/poteto-mode/SKILL.md). Full guide: [`pstack/README.md`](./pstack/README.md).

Superpowers activates via `using-superpowers` bootstrap — skills trigger automatically. See [`superpowers/README.md`](./superpowers/README.md) for workflow: brainstorming → writing-plans → subagent-driven-development → tdd.

## License

MIT — see [LICENSE](./LICENSE). `pstack/` upstream is MIT © 2026 Lauren Tan. `superpowers/` upstream is MIT © Jesse Vincent.
