# Local test record: v3

Changes from v2 (`official/solution/`): after each Energy action the agent checks whether the
targeted statistic rose, and marks it capped if not; by default Energy goes to Skill learning plus
one point on a statistic that is not capped; no high-intensity work after month 36; from month 37,
Defuse legacy risk whenever the feed is not calm.

Two games, engine 1.0.6 / data 1.0.8, DeepSeek V4.1 Flash (own key):

| Game | Outcome | Score | Level |
|---|---|---|---|
| 1 | completed, 48 months | 65.34 | L5 |
| 2 | completed, 48 months | 55.48 | L4 |

Rejected: lower than v2. In game 2 the agent chose Skill learning only four times, so the new rule
was mostly not exercised; the run stayed at L1 until month 12 and at L2 until month 30.
