---
name: career-survival
description: Play one 48-month Career Survival game through the official MCP tools. Use it for every decision in the run (story choices, quarterly Energy actions, the quarterly main action) and whenever a review grade, warning or loss appears. Survival comes first; within it, aim for promotions, wealth and balanced statistics at month 48.
---

# Game loop

1. Call `show_employee_handbook` once and `new_game` once. Keep the `session_id`; never start a second game, even after a bad review.
2. Before every decision call `observe`. Read the event, the feed, the status and the offered choices with their listed costs and effects.
3. Call `take_action` with one offered integer `choice` and a one-sentence `notes` written in English. Success means the action was accepted, not that it helped. Observe again before the next decision.
4. If a call fails or times out, observe and then call `check_latest_logs` before retrying: the action may already have happened. Use `check_latest_logs` only for this recovery.
5. When an `ending_score` appears, print it in full, then print DONE. Otherwise continue to month 48.

Do not reread the handbook or this Skill, do not use the code tool, and do not restate the whole status in notes.

# Memory to carry

Keep a compact record and update it after each accepted action:

- **Risk level**: calm, some, high, critical or unknown (see the risk gauge below).
- **Blow-ups**: how many serious incidents or trust crises have happened in this run. Keep this count for the whole run; do not forget it when the feed turns calm.
- **Reviews**: the last two grades and the manager's main criticism.
- **Level bests**: the highest Skill, Network and Output seen since the last promotion, and which of them are full (a statistic is full when it did not rise right after an Energy action aimed at it). Reset at each promotion. Health and Dignity at 10 are at their published maximum and count as full.
- **Next review month**: the next multiple of 6.

If memory is lost, set the risk level to unknown, observe, and read recent logs to rebuild it.

# Risk gauge

The feed may include remarks from HR, the manager or colleagues about how you are doing. Read their tone, not their exact words. The levels below are this Skill's planning labels, not simulator states:

- reassuring or praising: calm;
- mild concern that is described as not yet serious: some;
- concern that risk has been building up, or repeated concerns: high;
- withdrawn support, warnings that past problems are about to surface, or a trust or security incident: critical.

Offered choices that list a risk-increasing effect raise the level by one step if taken. Treat any explicit incident as critical.

# Decision priorities

Apply these in order. A higher rule overrides a lower one, except where a rule says otherwise.

1. **Avoid immediate failure.** Health reaching 0 ends the run, and the handbook names lasting low Dignity, zero Network, negative Wealth, repeated poor reviews, lagging Skill and accumulated hidden risk as failure directions. This Skill's own safety margins (policy, not simulator thresholds):
   - Health 4 or below: buy Health recovery at the next Energy phase and avoid choices that cost Health.
   - Dignity 4 or below: buy Mental recovery; avoid humiliating or self-blaming story options.
   - Network 1 or below: prefer options that repair relationships; never let it sit at 0.
   - Wealth 2 or below: refuse every optional purchase or paid convenience in stories; prefer options that cost nothing. Flag Wealth 1 or below immediately.
   - Weak reviews (own policy): repeated poor reviews are a published failure route. After a D, or a second C in a row, repairing performance counts as survival (see rule 5) and outranks rule 2, except at critical risk.
2. **Cut accumulating risk.** At risk level some: avoid any choice with a listed risk-increasing effect, and from month 37 also spend 2 Energy on Defuse legacy risk, because risk control is an ending dimension. At high or critical, or after any blow-up: spend 2 Energy on Defuse legacy risk when available. Take Lay low and reduce risk as the main action only at critical risk or right after a blow-up; otherwise keep the main action on performance. Keep cutting risk in later quarters while warnings continue. At unknown: avoid risk-raising choices until evidence returns.
3. **Do not create new incidents in stories.** Prefer prompt and factual disclosure, realistic scope and deadlines, fixing security or privacy problems properly, documented decisions, and cooperative repair. Reject concealment, false metrics, silent overcommitment, shifting blame, shortcuts on known defects, and escalating disputes into formal confrontations when a quieter resolution is offered. When no option is clearly safe, pick the one with the smallest lasting downside.
4. **Protect the next review.** Working assumption from in-run observation, not a published rule: each level seems to let Skill, Network and Output rise only so far, and a missed promotion usually means one of them is below what the level needs. So before every review, bring back any statistic that is below its level best (Network maintenance for Network, Prepare report materials for Output, one point at a time), and treat a statistic that fell as more urgent than one that is still rising. In the two months before a review month, do not take story options that cost Network or Output unless rule 1 requires it. Do the preparation in the quarter before the review rather than leaving it to the review month itself. Preparation means visible delivery and relationships; Prepare report materials only helps while Output is not full. After a missed promotion with a B grade or better, name in notes which statistic fell or is still rising, and spend the next two quarters on it.
5. **Repair a weak review.** After a C or D, name the manager's criticism in notes and change at least one concrete thing before the next review: deliver visible output, rebuild relationships, or stop a stalled routine. From a C or D until the next review, normally choose an offered main action whose listed effects address the manager's criticism (for example Report results to your manager, Apply for a key project, Showcase results, Build a mentorship or Repair a key relationship; the list is illustrative), and spend Energy on the statistics the feedback names unless they are full. At critical risk, rule 2 overrides; if no suitable action is offered, apply the missing-option rules below. Treat a D, or two weak grades in a row, as an emergency: no risky stories, no high-intensity work, focus on visible delivery and relationships. A calm feed after a weak review is not proof of safety.
6. **Use surplus wellbeing.** When Health and Dignity are both 8 or above (own policy margin), do not buy recovery, and in stories a small Health or Dignity cost may be worthwhile for an option with a clearly listed benefit to work, skill or relationships, while keeping enough buffer for later setbacks.
7. **Grow when safe.** When the risk level is calm, Health and Dignity are 5 or above and no warning is active, spend Energy only on statistics that are not full. Default plan (own policy): first restore Network or Output if either is below its level best; otherwise Skill learning (2 Energy) while Health is 6 or above, then 1 Energy on Network maintenance or Prepare report materials, whichever is not full. If both are full, spend the last point on Health recovery or Mental recovery when that statistic is below 10; otherwise reserve it. In stories, prefer options that build skill through real technical work, training or automation, and options that complete visible deliverables.

# Quarterly phase

- Use the costs and effects listed in the current offer, never remembered choice numbers. Energy is 3 per quarter, does not carry over, and the main action is separate.
- Observe after every Energy action; remaining Energy and choices change.
- After each Energy action, compare the statistic it targets with its value before the action. If it did not rise, mark it full and do not spend on it again until a promotion or until it falls below its level best. Network maintenance and Prepare report materials also add Dignity; at Dignity 10 only their Network or Output part counts.
- Do not buy recovery at Health or Dignity 7 or above unless a specific hazard is coming or every growth option is full; spend that Energy on Skill, Network or Output instead.
- **High-intensity work** raises hidden risk. Use it only if all hold: month 36 or earlier, risk calm, no blow-up so far, Health and Dignity 7 or above, Output not full, and the next review needs Output that safer actions cannot supply.
- **Main action**: pick the offered option whose listed effects improve the gap the manager's feedback points to (key project, rotation, mentorship, reporting results). Use relationship repair or risk reduction when those are the binding need.

# When rules conflict or an option is missing

- Two rules disagree: follow the higher one; among equal needs, fix the statistic closest to its margin first.
- The preferred action is not offered: take the offered option with the best listed effect on the same need; if none helps, take the one with the smallest lasting downside.
- Effects are unknown: prefer reversible, low-cost options and observe the result before committing more.
- Resources cannot cover everything: survival needs first, then risk, then the next review.

# Across the 48 months

- **Months 1 to 12**: survival matters most. Keep Network and Output growing a little every quarter, keep Wealth above the cash margin, and avoid any blow-up. An early elimination costs far more than a slow start.
- **Months 13 to 36**: aim for a promotion at each six-month window. Higher levels have higher overall requirements, so keep Skill rising through stories and Skill learning while Network and Output are maintained, and close whatever gap the manager's feedback or a missed promotion points to.
- **Months 37 to 48**: protect what you have. Avoid risk and clear hidden risk with Defuse legacy risk whenever the feed is not calm (risk control counts at the ending), keep Wealth growing (it also counts), and stop investments that would only pay off after month 48. Still prepare for the last reviews.

A later level pays a higher salary, so an earlier promotion is worth more over the remaining months; never trade survival for it.
