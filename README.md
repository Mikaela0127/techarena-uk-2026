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
| `round3-submission/` | The round-3 candidate (v21d): v2 plus the log-driven rules, its design documents, and the video script and slides |
| `experiments/` | The experiments I kept, each with its own `TESTS.md`, plus small tools for running games and reading logs |

The presentation videos are not included (file size, and they show team members).

## Results

| Round | Version | Official score |
|---|---|---|
| 1 | v2 (`round1-submission/`) | 58.12 |
| 2 | A teammate's version (not in this repository) | 58.88 |

On the contest scoreboard as viewed on 3 November 2026, the team was 32nd of 70 scored teams (227 registered
teams in total). Local results for each variant, including the
games that went badly, are in the `TESTS.md` files.

## Notes

- Only my own work is here; my teammates' versions, data and analyses stay in the team's private repository.
  The design documents summarise aggregate team test results in a sentence or two, without their implementations.
- The round-3 design report counts the first eight own-key games of v21d; three later control games, two of them
  eliminated, are listed in `experiments/career-survival-v21d/TESTS.md`.
- The simulator, runner and model endpoint belong to the organisers and are not included.
- The history of this repository starts when the team repository was reorganised; earlier history and other
  members' files were removed before publishing.
