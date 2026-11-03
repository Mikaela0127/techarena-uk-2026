# Local test record

`solution/` holds the `README.md`, `manifest.json`, `design/` and `skills/` of the ZIP submitted on
27 October; they are byte-identical to that ZIP. The ZIP also contains `presentation.mp4`, which is
not committed (it is large and shows a team member). `video/` holds the script that was read on
camera and the slides shown beside the speaker.

Local games on engine 1.0.6 / data 1.0.8, model DeepSeek V4.1 Flash through the team's own key
(the official evaluation uses deepseek-v4-flash through OpenRouter, so results may differ). Games 1
and 2 ran before two review edits to the Skill: the rule-conflict clause now names its exceptions,
and the reason given for using surplus wellbeing was corrected. Both games already included the rule
changes described in `solution/design/decision_report.md`. Games 3 to 6 used the exact ZIP contents.

| Game | Outcome | Score | Level | Review grades | Input tokens |
|---|---|---|---|---|---|
| 1 | completed, 48 months | 67.87 | L5 | C, B, B, B, B, A, B, B | 37.9M |
| 2 | completed, 48 months | 68.41 | L5 | C, B, B, B, B, A, B, B | 37.7M |
| 3 | completed, 48 months | 53.73 | L4 | C, C, C, B, B, B, B, B | 37.3M |
| 4 | completed, 48 months | 66.91 | L5 | C, C, B, B, B, A, A, A | 37.4M |
| 5 | completed, 48 months | 71.96 | L5 | C, C, B, B, B, A, A, B | 38.0M |
| 6 | completed, 48 months | 60.92 | L4 | C, C, C, B, B, B, A, A | 42.3M |

Mean 64.97 (standard deviation 6.6), no eliminations. The two L4 games both received three C grades
in the first eighteen months and finished one level lower.

Variants tried and rejected on the same setup are in `experiments/career-survival-v3` and
`experiments/career-survival-v4`.

Later control games with the same files, engine 1.0.6 / data 1.0.8:

| Date | Model | Outcome | Score | Level | Notes |
|---|---|---|---|---|---|
| 31 Oct | own key | completed, 48 months | 64.23 | L5 | control for `experiments/career-survival-v17` |
| 31 Oct | own key | completed, 48 months | 64.77 | L5 | control for `experiments/career-survival-v17` |
| 31 Oct | competition (deepseek-v4-flash) | eliminated, month 36 (trust crisis) | 39.92 | L4 | |
| 31 Oct | competition (deepseek-v4-flash) | completed, 48 months | 72.06 | L5 | the agent never loaded the Skill in this game |
