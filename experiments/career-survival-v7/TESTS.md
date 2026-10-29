# Local test record: v7

Changes from v2 (`official/solution/`), both replacing existing wording rather than adding sections:

1. Grades in context. The memory records whether each grade came with a promotion. A grade that
   came with a promotion is not weak; a promotion ends the weak-review emergency and restarts the
   count. A D, or two weak grades at the same level without a promotion, remain an emergency.
2. Stalled Energy actions are excluded. An Energy action that twice gave no visible gain in its
   intended statistic at the current level is not chosen again until a promotion or until that
   statistic falls; the Energy goes to Skill learning while Skill still rises, otherwise to another
   rising statistic or to Defuse legacy risk when the feed is not calm.

Designed with a Codex discussion (gpt-6.1-sol, xhigh, 29 October). Why: every L1 promotion in our
runs came with a C, so v2's "second C in a row" emergency could fire right after a promotion; and
v2 spent 7 to 13 Energy on Prepare report materials at L4 after Output had stopped rising.

Played four games on the competition key (29 October, 11:14 to 13:42 UK, engine 1.0.6):

| Run | Score | Outcome | L3 / L4 / L5 reached | Final Skill / Network / risk | Input tokens |
|---|---|---|---|---|---|
| 20261029T111436Z | 58.80 | completed | m18 / m30 / - | 89 / 36 / 2 | 38.5M |
| 20261029T114639Z | 64.55 | completed | m12 / m18 / m42 | 124 / 54 / 8 | 56.9M |
| 20261029T123536Z | 51.36 | completed | m30 / m48 / - | 46 / 26 / 1 | 37.7M |
| 20261029T130801Z | 44.30 | eliminated at m48 (second major blow-up) | m30 / m36 / - | 70 / 36 / 10 | 43.3M |

Mean 54.75, against 65.90 for v2 over eight games (the six in `official/TESTS.md`, mean 64.97,
plus 71.13 and 66.23 on 28 October). Not adopted.

What the logs show:

- Two games stayed at L2 for 24 months with three C grades in a row. Output and Network were at
  their L2 best after each quarterly phase, then fell in the stories of the two months before the
  review. This is the same story-driven miss seen in v2, but longer.
- Change 1 was not followed: in the game stuck at L2 the notes counted the C that came with the L1
  promotion ("after two C grades" at the first L2 review). In emergency mode that game still chose
  High-intensity work seven times, which the emergency rule forbids.
- Change 2 was not followed: one game chose Prepare report materials 17 times at L4 and above,
  while Output was not rising; Skill learning at L4 was chosen 0 to 2 times per game.
- Costs: $0.76, $1.67, $1.21, $0.87 of competition credit.
