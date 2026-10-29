# Local test record: v5

Changes from v2 (`official/solution/`): a skill phase. Once Network and Output are observed to be
full at the current level, growth shifts to Skill in stories, the main action and Energy, below the
survival, risk, incident, review and repair rules. The agent also records which kinds of story
option raised Skill. The trigger is not limited to a level; outside the skill phase the rules are
those of v2.

Two games on engine 1.0.6 / data 1.0.8 with the competition key (OpenRouter, deepseek-v4-flash):

| Game | Outcome | Score | Level | Review grades | Input tokens |
|---|---|---|---|---|---|
| 1 | eliminated, 24 months | 19.23 | L1 | C, C, D, D | 18.5M |
| 2 | completed, 48 months | 57.84 | L5 | C, C, B, B, B, B, B, A | 43.3M |

Game 1 never left L1 and its notes never mention the skill phase; its Energy and main actions matched v2.
Network or Output fell in the months of the first reviews. In game 2 the skill phase was only
partly followed: Skill learning 5 times at L4, but the main action was always the key project and
Skill per story at L4 was 0.77; promotion to L5 came at month 48. Not adopted.

Metrics compared with v2:

- the month of reaching L4 and L5, and the months spent at L4;
- Skill gained per story at L4 (v2: 0.69 to 1.06);
- how often the rotation main action and Skill learning were chosen at L4 (v2: rotation once in 79 main actions at L4; Skill learning rarely, mostly Prepare report materials);
- the lowest Health at L4, and whether Network or Output fell before a review.
