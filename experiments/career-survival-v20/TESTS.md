# career-survival-v20: test results

v16 (v2 SKILL.md + "Ending dimensions: wealth and risk") plus: one sentence added to rule 3 (never share, hint at or
confirm confidential information), an "After a blow-up" section, and v19's "Before a review" section. No plateau
section (v17-v19 with it reached L2 at month 6 in only 1 of 6 competition-key games; v2 2 of 2 that night).

Why: on 31 Oct three competition-key games ended by a second blow-up or trust crisis; two of those came right after
the agent hinted at an unpublished restructure, and none switched to Defuse plus Lay low after the first blow-up.

Competition key (OpenRouter `deepseek-v4-flash`), engine 1.0.6:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | Wealth | Risk | Network | Skill | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261031T222847Z | none | max_continuations at ~m7 | 932 C->L1 | - | - | - | - | - | 3.7M |

20261031T222847Z: the agent repeatedly ended turns with text such as "Action accepted. Let me observe the next state" (often after
printing a "Memory:" line) without a tool call; all 20 runner continuations were used by month 7. Earlier v2-family
games used 0-5. Fixed in v21 (explicit "every reply must contain a tool call").
| 20261031T222902Z | 14.40 | eliminated m11 | 933 C->L1 | 0.1 | 0 | 3 | 9 | 13 | 6.1M |

20261031T222902Z: blow-up in month 8 at L1, then Health/report/key project instead of Defuse plus Lay low (the appended
rule was ignored), trust crisis in month 10. Blow-ups across all games: 12 of 21 on deepseek-v4-flash vs 6 of 24 on
the own key; the HR tone was often calm before them. v22 moves the critical rules into the manifest instruction.
