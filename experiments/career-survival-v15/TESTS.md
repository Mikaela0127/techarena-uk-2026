# career-survival-v15: test results

Base: v2 (`official/solution/`). SKILL.md changes:

- Risk: a risk tally of accepted choices whose displayed `status_updates` raise or lower `HiddenRisk`; no action whose
  displayed effects raise it, for Energy actions and main actions (one exception for review emergencies); risk reduction whenever the tally is above zero.
- Wealth: in stories, among options of similar risk, choose the one that spends no money.
- Balance: keep Output, Skill and Network rising together; favour Network when feedback points to relationships.
- Missed promotion after a B or better: change the main action or Energy mix toward what was not yet demonstrated.
- Loop: notes of at most 15 English words; every reply during the game contains a tool call; retry exit; continue
  until `ending_score`.

Rubric self-check (Codex gpt-6.1-sol, published rubric only, estimate): v2 90, v14 89, v15 93.

Games on the competition key, engine 1.0.6:

| Run | Score | Outcome | Level | Wealth | Risk | Network | Skill | Tokens |
|---|---|---|---|---|---|---|---|---|
| 20261031T184532Z | 52.73 | completed | L4 (L2 m12, L3 m24, L4 m30) | 29.1 | 7 | 35 | 83 | 62.3M |

Game 1 (competition key): promotions one window slower than v2/v14; main action was a key project only 9 times
(v2 15, v14 14) because the missed-promotion rule moved it to reporting; no risk-raising action was taken, yet risk
ended at 7 with "about to go off" in month 47. Superseded by v15b (main action default, end-game risk clean-up).
