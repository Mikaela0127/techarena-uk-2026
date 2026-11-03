# Hachimi Mambo: risk-first career ladder, review-ready

Team: Hachimi Mambo. Submission: Career Survival v21d: risk-first career ladder, review-ready. Runs in JiuwenSwarm 0.2.4b3 single-agent mode (`"mode": "agent"`).

## What is submitted

| Path | Purpose |
|---|---|
| `manifest.json` | Team, submission name, `agent` mode, and a short instruction that loads the Skill and fixes the game loop. |
| `skills/career-survival/SKILL.md` | The only Skill: the game loop, the compact memory, a risk gauge, seven ordered decision priorities, the quarterly rules, a 48-month plan, and three short policies added from our test logs (ending protection, after a blow-up, before a review). |
| `design/skills_design.md` | Why the design has one Skill, what each section does, and what information it uses. |
| `design/decision_report.md` | The decision approach, the evidence behind it, the principal risks and how it generalises. |
| `presentation.mp4` | The team's video answering the five required questions. |

There are no scripts and no reference files. The design never needs to run code, so none is included, and the agent is told not to use the code tool.

## How it plays

The agent observes before every decision, takes one offered choice with a one-sentence note, and observes again. Its decisions follow a fixed priority order: avoid immediate failure, cut accumulating risk, avoid creating incidents in stories, protect the next review, repair a weak review, use surplus wellbeing, and only then grow. All limits in the Skill are the team's own safety margins, stated as policy; none is presented as a simulator threshold.

This version keeps the earlier Skill's text and adds only what the logs of failed test runs showed was missing: a tool call in every reply, no confidential information in stories, extra caution after a first incident, and protecting Output and Network in the two months before each review. `design/decision_report.md` gives the evidence. `presentation.mp4` is the team's video answering the five required questions.

## Local check

From the participation repository root, with this folder copied to `solution/`:

```sh
uv run python -m career_sim_runner validate --submission solution
make play
```
