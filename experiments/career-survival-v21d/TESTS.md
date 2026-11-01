# career-survival-v21d: test results

v21c plus one sentence in rule 3: staying silent about misconduct or harm, or dealing with it only quietly on the side,
counts as concealment; raise it through a proper channel.

Own DeepSeek key (`deepseek-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T040822Z | 63.48 | completed | 933 C->L2 / L2 B->L3 / L3 B->L4 | m6 / m12 / m18 / m42 | 26.9 | 5 | 48 | 20 | 36.2M |
| 20261101T040836Z | 78.29 | completed | 933 C->L2 / L2 B->L3 / L3 B->L4 | m6 / m12 / m18 / m36, L6 m48 | 45.5 | 0 | 58 | 19 | 39.7M |
| 20261101T040851Z | 50.58 | completed | 832 C->L1 / O2 C->L2 / B->L3 | m12 / m18 / m36 / - | 23.3 | 6 | 36 | 18 | 39.1M |
| 20261101T040906Z | 58.50 | completed | 923 C->L2 / S18 B / B->L3 | m6 / m18 / m24 / m48 | 24.0 | 6 | 33 | 19 | 36.6M |
| 20261101T114925Z | 66.42 | completed | 933 C->L2 / L2 C / B->L3 | m6 / m18 / m30 / m48 | 28.7 | 0 | 39 | 20 | 40.2M |
| 20261101T114940Z | 63.20 | completed | 933 C->L2 / B->L3 / L3 B | m6 / m12 / m24 / m42 | 26.3 | 5 | 51 | 18 | 39.0M |
| 20261101T114955Z | 69.62 | completed | 833 C->L2 / B->L3 / L3 B | m6 / m12 / m24 / m42 | 30.8 | 0 | 49 | 20 | 38.4M |
| 20261101T115010Z | 54.17 | completed | 922 C->L1 / 932 C->L2 / B->L3 | m12 / m18 / m30 / - | 29.7 | 6 | 36 | 20 | 37.5M |

Games 1-4: all completed; 3/4 L2 at month 6; first L6 in any of our games (20261101T040836Z: L5 at m36, L6 at m48).

Games 5-8 (stability check): all completed. Over 8 games: mean 63.03 (50.58-78.29), no early exits, 6/8 L2 at month 6.
Risk (raw) 0 in 3/8 games and 5-6 in the rest; no final-year story stands out across our games, and the HR remark was
reassuring for the last eight months of 20261101T115010Z, which still ended at 6.

Control games on the own key at 17:13 1 Nov, right after the v21g games:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T171243Z | 55.48 | completed | - | m12 / m24 / m42 / - | 21.9 | 0 | 36 | 19 | 44.6M |
| 20261101T171258Z | 21.07 | eliminated m6 (Health 0) | - | m6 / - | 3.6 | 4 | 7 | 8 | 2.3M |
| 20261101T171313Z | 19.61 | eliminated m6 (Health 0) | - | - | 2.6 | 3 | 2 | 10 | 2.6M |

Both ended in a blackout at month 6 with the Skill loaded: Health sat at 3-5 from month 3, and in 20261101T171313Z the
agent took an Energy choice by number from its plan for a story (Skill learning, Health -1) at Health 1.

Competition key (OpenRouter `deepseek-v4-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T155214Z | 47.52 | eliminated m47 (trust crisis) | 933 C->L2 / L2 C / B->L3 | m6 / m18 / m30 / - | 26.9 | 10 | 34 | 17 | 41.1M |
| 20261101T155229Z | 68.56 | completed | 903 C->L1 / 933 C->L2 / B->L3 | m12 / m18 / m24 / m42 | 27.9 | 0 | 44 | 20 | 54.5M |

20261101T155214Z never loaded the Skill: no skill tool call, and no Skill text anywhere in its event log. It played from
the manifest instruction alone, ignored three final-year risk warnings and ended in a trust crisis at month 47. Across
all our local games, 7 show no Skill load (mostly on the competition key); 20261031T220222Z (v2, 72.06) was one of them.
