# career-survival-v21: test results

v20 (v16 + confidentiality sentence in rule 3 + "After a blow-up" + "Before a review") plus the "every reply must
contain a tool call" paragraph and one manifest sentence. Purpose of these runs: does the pre-review section raise
the share of games that pass L1 at month 6 or 12? Own-key baseline on 31 Oct-1 Nov: 5 of 14 reached L2 at month 6.

Own DeepSeek key (`deepseek-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T023706Z | 73.43 | completed | 933 C->L2 / L2 C->L3 / L3 B->L4 | m6 / m12 / m18 / m36 | 37.7 | 0 | 54 | 20 | 38.4M |
| 20261101T023721Z | 56.75 | completed | 933 C->L2 / N5 C / B->L3 | m6 / m18 / m30 / - | 30.0 | 5 | 36 | 20 | 39.2M |
| 20261101T023736Z | 68.07 | completed | 931 C->L2 / N4 C / B->L3 | m6 / m18 / m24 / m48 | 36.1 | 0 | 40 | 19 | 38.8M |
| 20261101T023751Z | 55.25 | completed | 933 C->L2 / O3 C / B->L3 | m6 / m18 / m30 / - | 27.0 | 6 | 36 | 20 | 38.0M |

Own key: 4/4 reached L2 at month 6 (baseline 5/14 that night). The month-12 review then found Network or Output
below the L2 maxima in 3/4 games, although both were at the maxima in month 9: stories in months 10-11 lowered them.

Competition key (OpenRouter `deepseek-v4-flash`), at most 2 games:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | L2 / L3 / L4 / L5 | Wealth | Risk | Network | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261101T025416Z | 31.53 | eliminated m24 | 923 C->L1 / 933 C->L1 / 932 C->L1 | m24 / - | 8.3 | 0 | 2 | 16 | 21.6M |
| 20261101T025431Z | 70.75 | completed | 933 C->L2 / L2 B->L3 / L3 B->L3 | m6 / m12 / m24 / m42 | 31.5 | 0 | 54 | 19 | 61.9M |
