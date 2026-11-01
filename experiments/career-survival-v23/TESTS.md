# career-survival-v23: test results

Minimal change from v2 (`official/solution/`), each addressing a failure seen on 31 Oct on the competition key:

1. Game loop: "every reply must contain a tool call" (v20 game 1 ran out of runner continuations by month 7).
2. Rule 3: "Never share, hint at or confirm unpublished or confidential information" (two second blow-ups came right
   after hinting at an unpublished restructure).
3. Appended "Ending dimensions: wealth and risk" from v16 (the wealth guard applies throughout; the risk clean-up from month 40).

One manifest sentence for each of 1 and 3. Everything else is v2 text, so early-game priorities should be close to v2's,
which reached L2 at month 6 in 2/2 competition-key games that night while heavier variants managed 1/7.

Competition key (OpenRouter `deepseek-v4-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | Wealth | Risk | Network | Skill | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261031T225642Z | 57.97 | completed | 831 C->L1 / 933 C->L2 / L2 B->L3 | 33.7 | 5 | 37 | 103 | 14 | 62.6M |
| 20261031T225657Z | 43.91 | eliminated m45 | 932 C->L2 / L2 C / L2 B->L3 | 20.8 | 0 | 35 | 71 | 16 | 54.2M |

20261031T225657Z: concealment choices in months 42-43 ("leave it there", "say nothing") despite rule 3, second blow-up
in month 45; Output was capped at 26 while all Energy still went to report materials.
