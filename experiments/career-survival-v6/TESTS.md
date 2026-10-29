# Local test record: v6

Changes from v2 (`official/solution/`): one rule, "Protect the next review", rewritten in place. It
now says that the review comes before that month's Energy phase, so in the two months before it
only story choices move Network and Output; it names the kinds of option that usually cost them
(turning someone down, refusing a request, public confrontation, formal escalation, days of side
work), makes the cooperative option the default in those months within rule 3, and asks the agent
to win back a loss with the next stories. Nothing else changed.

Why: in our own runs every L1 review where Skill, Network or Output had just fallen missed the
promotion (9 of 9), against 14 promotions in 18 reviews without a fall. Missing the month-6
promotion cost about 5 points in completed games (61.2 against 66.0) and preceded both of our L1 dismissals. In v5 game 1 the
agent declined an invitation "to focus on own team delivery before the month 6 review", lost two
Network, and missed the promotion.

Two games on engine 1.0.6 / data 1.0.8 with the competition key (OpenRouter, deepseek-v4-flash),
29 October 00:41-03:08:

| Game | Outcome | Score | Level | Review grades | Input tokens | Time |
|---|---|---|---|---|---|---|
| 1 | completed, 48 months | 58.33 | L4 | C, C, C, B, B, B, A, B | 61.8M | 64 min |
| 2 | completed, 48 months | 54.20 | L5 | C, C, B, B, B, B, B, A | 62.2M | 82 min |

Game 1 missed the L1 promotion at months 6 and 12 and was promoted at month 18. In month 5 it took
the two-week side project the rule warns against (Network -1, Output -2), won part of it back in the
next story, and still went into the review below its best. Game 2 was promoted at month 6. In the
two months before reviews, declining or refusing fell from 6% of story choices (v2 to v5) to 3%,
but the share of those stories that cost Network or Output stayed at 27%. Both games ran past the
runner's 60-minute agent frame and continued in a second frame; input tokens rose to about 62M
(v2: 37M to 50M) and output tokens roughly doubled. Not adopted: both scores are below every
completed v2 game but one.

Metrics compared with v2:

- L1 promotion at month 6, and whether Network, Output or Skill fell in months 4 and 5;
- outcome, score and level at month 48;
- input tokens per game.
