# Hachimi Mambo: risk-first career ladder

> **Experimental, not adopted.** This is test variant v6; see `TESTS.md` for its results. The
> submitted version is `official/solution/`. Do not submit this folder.

Team: Hachimi Mambo. Submission: Career Survival: risk-first career ladder. Runs in JiuwenSwarm 0.2.4b3 single-agent mode (`"mode": "agent"`).

## What is submitted

| Path | Purpose |
|---|---|
| `manifest.json` | Team, submission name, `agent` mode, and a short instruction that loads the Skill and fixes the game loop. |
| `skills/career-survival/SKILL.md` | The only Skill: the game loop, the compact memory, a risk gauge, seven ordered decision priorities, the quarterly rules and a 48-month plan. |
| `design/skills_design.md` | Why the design has one Skill, what each section does, and what information it uses. |
| `design/decision_report.md` | The decision approach, the evidence behind it, the principal risks and how it generalises. |
| `presentation.mp4` | The team's video answering the five required questions. |

There are no scripts and no reference files. The design never needs to run code, so none is included, and the agent is told not to use the code tool.

## How it plays

The agent observes before every decision, takes one offered choice with a one-sentence note, and observes again. Its decisions follow a fixed priority order: avoid immediate failure, cut accumulating risk, avoid creating incidents in stories, protect the next review, repair a weak review, use surplus wellbeing, and only then grow. All limits in the Skill are the team's own safety margins, stated as policy; none is presented as a simulator threshold.

## Local check

From the participation repository root, with this folder copied to `solution/`:

```sh
uv run python -m career_sim_runner validate --submission solution
make play
```
