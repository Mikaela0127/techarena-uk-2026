# career-survival-v26: test results

v23 plus a "keep replies short" paragraph in the game loop (at most one short sentence between tool calls, reasons
only in notes, no printed memory or narration) and one manifest sentence.

Why: on the competition model the agent's visible text between tool calls was ~315k characters per game (own key
~81k), as large as all observe results together, and it is re-sent with every later call. v23 on the competition key
used 62.6M tokens (token-efficiency score ~58).

Competition key (OpenRouter `deepseek-v4-flash`), engine 1.0.6, at most 2 games:

| Run | Score | Outcome | Review stats m6 / m12 / m18 | Wealth | Risk | Network | Skill | H+D | Tokens | Transcript chars |
|---|---|---|---|---|---|---|---|---|---|---|
| 20261101T015743Z | 60.13 | completed | 932 C->L2 / L2 B->L3 / L3 B->L3 | 25.7 | 5 | 35 | 103 | 20 | 60.7M | 343,673 |
| 20261101T015758Z | 29.18 | eliminated m24 | 832 C->L1 / 912 C->L1 / 920 D | 9.2 | 0 | 0 | 9 | 17 | 14.6M | 54,511 |

The concise rule was followed in one game (about 2.3k transcript characters per month, versus about 6.6k for v23)
and ignored in the other (343k characters, 60.7M tokens). Instructions alone do not reliably cut tokens.
