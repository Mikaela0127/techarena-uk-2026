# career-survival-v21g: test results

v21d with one manifest change: the instruction now says the first tool call must load the career-survival skill with
the skill tool, before the handbook or a new game. The Skill text is unchanged from v21d.

Reason: v21d competition-key game 20261101T155214Z never loaded the Skill (no skill tool call, no Skill text in the
event log), played from the manifest alone and was eliminated at month 47; 7 of our local games show the same.

Own DeepSeek key (`deepseek-flash`), engine 1.0.6:

| Run | Score | Outcome | Skill loaded first | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T165759Z | 21.47 | eliminated m15 (second blow-up) | yes | m6 / m12 / - / - | 3.9 | 10 | 12 | 8 | 7.2M |
| 20261101T165844Z | 14.38 | eliminated m8 (second blow-up) | yes | - | -0.8 | 10 | 3 | 13 | 3.5M |
| 20261101T165814Z | 18.02 | eliminated m24 (L1 trap) | yes | - | 4.1 | 6 | 0 | 12 | 14.9M |
| 20261101T165829Z | 57.50 | completed | yes | m12 / m18 / m36 / - | 27.0 | 1 | 36 | 20 | 39.5M |

3 of 4 ended early (two second blow-ups, one L1 trap), against 0 of 8 for v21d on the same key earlier in the day. The
Skill text is identical; v21d control games were run straight afterwards to separate a manifest effect from a bad
model afternoon.

Competition key (OpenRouter `deepseek-v4-flash`):

| Run | Score | Outcome | Skill loaded first | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T182339Z | 20.98 | eliminated m24 (L1 trap; D at m18 with S9 N3 O3) | yes | - | 7.1 | 2 | 2 | 9 | 16.4M |
| 20261101T182354Z | 51.80 | completed | yes | m12 / m24 / m30 / - | 27.7 | 5 | 36 | 15 | 62.2M |

The skill-first instruction worked in all 6 games (Skill loaded by the first tool call).
