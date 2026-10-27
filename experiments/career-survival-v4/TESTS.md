# Local test record: v4

Changes from v3 (`../career-survival-v3/`): the agent remembers the best Skill, Network and Output
seen since the last promotion and restores any that fell before the next review, stated in the Skill
as a working assumption without numbers.

Two games, engine 1.0.6 / data 1.0.8, DeepSeek V4.1 Flash (own key):

| Game | Outcome | Score | Level |
|---|---|---|---|
| 1 | completed, 48 months | 61.99 | L5 |
| 2 | completed, 48 months | 65.55 | L5 |

Rejected: lower than v2. Both games reached L5 only at month 48.
