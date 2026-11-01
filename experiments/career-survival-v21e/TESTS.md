# career-survival-v21e: test results

v21d plus one Energy rule: when Prepare report materials or Network maintenance is stalled at the current level and
Health is 6 or above, spend that Energy on Skill learning while it still shows a visible gain; do not retry a stalled
action at the same level just to check it.

Reason (our own logs, 58 completed games): at L4, 226 Energy actions on Prepare report materials or Network maintenance
showed no visible gain, while Skill learning at L4 gave a visible gain all 32 times. The one L6 game differed from the
five other games that reached L5 at month 36 only in Skill before the final review (131 against 117-128).

Own DeepSeek key (`deepseek-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T141000Z | 65.56 | completed | 723 C->L2 / B->L3 / L3 B | m6 / m12 / m24 / m48 | 28.4 | 0 | 35 | 20 | 38.6M |
| 20261101T141015Z | 66.50 | completed | 933 C->L2 / B->L3 / B->L4 | m6 / m12 / m18 / m36 | 30.0 | 5 | 54 | 20 | 38.7M |
| 20261101T141029Z | 63.04 | completed | 913 C->L2 / B->L3 / L3 B | m6 / m12 / m24 / m42 | 26.5 | 5 | 43 | 20 | 38.1M |
| 20261101T141045Z | 64.98 | completed | 923 C->L2 / B->L3 / B->L4 | m6 / m12 / m18 / m42 | 27.6 | 2 | 44 | 17 | 37.8M |

Mean 65.02 (63.04-66.50), 4/4 completed, 4/4 L2 at month 6. The new rule hardly fired: Skill learning was chosen 3 times
in one game and never in the other three; the agent moved stalled Energy to Network (also capped) or kept retrying
report materials. The result is therefore not evidence for the rule itself.
