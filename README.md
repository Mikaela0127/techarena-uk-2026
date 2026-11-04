# Huawei Tech Arena UK 2026: Career Survival Agent

My work for the Huawei Tech Arena UK 2026 challenge, as a member and captain of team Hachimi Mambo.

The task: write agent Skills (Markdown instructions, optional scripts) for a JiuwenSwarm agent that plays a
48-month workplace simulator through MCP tools. Each game ends with a score built from level, wealth,
health and dignity, skill, risk control and network; a career can end early through repeated poor reviews,
serious risk incidents, health reaching zero or persistently low dignity. A submission was scored on three
official games, the quality of its SKILL.md files and its token use, and every submission included a short
video answering five fixed questions.

## Approach

One Skill, read once, with a fixed order of priorities: avoid immediate failure, cut accumulating risk,
create no new incidents in stories, protect the next review, repair a weak review, use surplus wellbeing,
and only then grow. Every limit in the Skill is a stated safety margin, not a claimed simulator threshold.

After the first official score came in below our local average, I played dozens of further games on the
unmodified official runner and read the event logs of every run that ended early. That gave three
early-exit routes, each answered by one short rule:

- the agent ended a turn with text instead of a tool call, until the runner stopped the run;
- a second blow-up, typically after hinting at confidential information or staying silent about a problem;
- a promotion missed because a story cost one point of a statistic just before the review.

The logs also showed what did not work, in these tests: several expanded variants with more rules did worse
on the competition model, softening the wording of one rule changed behaviour almost as much as removing
it, and in a few games the agent never loaded the Skill at all. Local scores come from single games on two
models and vary widely; the official scores below are weighted
automated scores whose live-play part averages three official runs.

## Layout

| Folder | Contents |
|---|---|
| `round1-submission/` | The round-1 submission (v2): Skill, manifest, design documents, video script and test record |
| `round3-submission/` | The round-3 submission (v21d): v2 plus the log-driven rules and its design documents; also a video script and slides written for v21d, but no new video was recorded and the submitted package reused the round-1 video |
| `experiments/` | The experiments I kept, each with its own `TESTS.md`, plus small tools for running games and reading logs |

The presentation videos are not included (file size, and they show team members).

## Results

Official scores:

| Round | Version | Official score |
|---|---|---|
| 1 | v2 (`round1-submission/`) | 58.12 |
| 2 | A teammate's version (not in this repository) | 58.88 |
| 3 | v21d (`round3-submission/`) | 75.08 |

In the Stage 1 ranking published on 4 November 2026, which takes each team's best round, the team was 3rd of
90 ranked teams (227 registered) and qualified for expert review as one of the top ten. Final results are due at
the online ceremony in late November 2026.

The official 75.08 is a composite: 80% of the mean of three official runs, plus 10% Skill quality and 10% token
efficiency. The local figures below are single-game scores under different conditions, so the two are not directly
comparable, and 75.08 should not be read as v21d's expected score in one game.

Local test games, one 48-month game each. "Own key" is a cheaper model on our own API key, "competition" is
the official evaluation model; the two are not comparable, and one game can differ from the next by 20 to 40
points, so every row shows all games, not only the best:

| Version | Model | Games | Completed 48 months | Mean | Best game |
|---|---|---|---|---|---|
| v2 | own key | 8 | 8 | 64.85 | 71.96 |
| v2 | competition | 2 | 1 | 56.0 | 72.06 |
| v21 | own key | 4 | 4 | 63.38 | 73.43 |
| v21 | competition | 2 | 1 | 51.1 | 70.75 |
| v21d | own key, first batch | 8 | 8 | 63.03 | 78.29 |
| v21d | own key, all games | 11 | 9 | 54.58 | 78.29 |
| v21d | competition | 2 | 1 | 58.0 | 68.56 |

Highlights:

- The best game, 78.29 with v21d, was the only one in all our testing to reach the sixth and highest level
  (level 5 at month 36, level 6 at the final review).
- Promotion at the first review, where a miss starts a common route to early dismissal, happened in 6 of 8
  first-batch v21d games on the own key, against 5 of 14 in an earlier own-key baseline.
- The v21d competition game that ended early never loaded the Skill at all; the alternative `v21g` in
  `experiments/` adds an instruction that makes loading it the first step.

Every game in the table, including the ones that went badly, is listed in the `TESTS.md` files (v2 in
`round1-submission/TESTS.md`).

## Notes

- Only my own work is here; my teammates' versions, data and analyses stay in the team's private repository.
  The design documents summarise aggregate team test results in a sentence or two, without their implementations.
- The round-3 design report counts the first eight own-key games of v21d; three later control games, two of them
  eliminated, are listed in `experiments/career-survival-v21d/TESTS.md`.
- The simulator, runner and model endpoint belong to the organisers and are not included.
- The history of this repository starts when the team repository was reorganised; earlier history and other
  members' files were removed before publishing.

## Licence

MIT, see `LICENSE`. This covers the material written for this repository (Skills, design documents, the
authored parts of the test records, and tools), not the simulator, runner or game content they refer to or quote.
