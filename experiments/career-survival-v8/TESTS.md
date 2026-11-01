# career-survival-v8: test results

Changes from v2 (`official/solution/`): SKILL.md only. A Scope section (input, output with an example note,
margins are this Skill's own), rules 2 and 5 split into bullets with the same wording, and rule 6 pointing
recovery purchases to the Quarterly phase rule (7 or above, which keeps its hazard exception). No number or priority changed; rule 6 now defers to the quarterly recovery rule instead of forbidding recovery outright at 8 or above.

Two games on the competition key, engine 1.0.6, 30 October:

| Run | Score | Outcome | L2 / L3 / L4 reached | Review grades to m18 | Tokens |
|---|---|---|---|---|---|
| 20261030T201248Z | none | stopped at m41 by the runner (`max_continuations`) | m18 / m24 / m36 | C, C, C | 47.0M |
| 20261030T204729Z | 53.67 | completed | m18 / m24 / m36 | C, C, C | 59.1M |

Both games stayed at L1 until month 18 with Network at 0-1 in the first year; v2 normally reaches L2 at
month 6. In the first game the agent repeatedly ended its turn with "continue the game loop" text instead
of a tool call, until the runner's 20 continuations ran out; this never happened in v2's eight games.
Not adopted.
