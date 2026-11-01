# career-survival-v17: test results

v16 (v2 SKILL.md unchanged + "Ending dimensions: wealth and risk") plus an appended "Plateaus" section: when Output or
Network has not risen for two quarters at the current level despite investment, move the main action and Energy to Skill;
when all three plateau, keep Health/Dignity high and reduce risk. One manifest sentence added.

Why: in 7/7 earlier games, Network stopped at ~36 and Output at ~26 during L4 (by month ~30) while the main action and
Energy kept going to them; L5 came at the first review after Skill reached ~100 (own observation, not written in the Skill).

Own DeepSeek key (`deepseek-flash`, not the competition model), engine 1.0.6:

| Run | Score | Outcome | L2 / L3 / L4 / L5 | Wealth | Risk | Network | Skill | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261031T201858Z | 71.38 | completed | m6 / m12 / m24 / m42 | 36.5 | 0 | 48 | 114 | 20 | 38.4M |
| 20261031T201913Z | 64.99 | completed | m12 / m24 / m36 / m48 | 28.3 | 0 | 37 | 94 | 20 | 38.2M |

Same night, same key: v2 64.23, 64.77; v16 59.33, 61.35.

Competition key (OpenRouter `deepseek-v4-flash`), engine 1.0.6:

| Run | Score | Outcome | L2 / L3 / L4 / L5 | Wealth | Risk | Network | Skill | H+D | Tokens |
|---|---|---|---|---|---|---|---|---|---|
| 20261031T203530Z | 20.98 | eliminated m24 | - | 8.1 | 3 | 2 | 9 | 10 | 17.6M |

20261031T203530Z: stuck at L1 (S9/N3/O3 by month 3); C, C, D, D. Story choices broke rule 3 twice (loosening CI
thresholds in month 5, hinting at an unpublished restructure in month 15); reviews cited "slips, friction, attitude".
Energy kept going to Output/Network after they stopped rising.
| 20261031T203515Z | 15.11 | eliminated m24 | - | 9.1 | 6 | 2 | 8 | 6 | 18.3M |

L1-trap finding (39 games, `scratchpad/rev.py`): promotion at the month-6 review happened almost only when Skill,
Network and Output were all at their L1 maxima (9/3/3) right before it; one point lost to a story in months 4-5 was
enough to miss it, and the same held at months 12 and 18. Stories that cost Output were time-consuming ones (long
training, intensive mentoring, rewrites, formal assessments, delays); those that cost Network corrected or confronted
people. Addressed in v19 (v17 + "Before a review" section).
