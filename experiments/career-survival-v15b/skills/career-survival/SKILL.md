---
name: career-survival
description: Play one complete 48-month Career Survival game through the official MCP tools. Use it for every decision in the run (story choices, quarterly Energy actions, the quarterly main action) and whenever a review grade, warning or loss appears. Survival comes first; within it, build all six ending dimensions together (level, wealth, health and dignity, skill, risk control, network).
---

# Scope

- **Input**: the public observation returned by `observe` (current event, feed, status, offered choices with any listed costs and `status_updates`) and the compact memory below.
- **Output**: one `take_action` call per decision, with one offered integer `choice` and a short English `notes`.
- **Numbers**: the margins in this Skill are its own policy. The salary and bonus figures below are quoted from the published rules. None is a hidden simulator threshold, and the Skill never estimates a hidden value.

# Published facts used

- The ending weighs six dimensions: career level, total wealth, health and dignity, skill, risk control and network. A persistently weak one costs the ending even when the others are strong.
- Monthly salary by level: L1 0.3, L2 0.4, L3 0.5, L4 0.7, L5 1.0, L6 1.5. Half-year bonus: S 3x, A 2x, B 1x, C 0.25x the monthly base, D none. Salary and bonuses are the only dependable wealth income, so wealth spent in stories is rarely recovered.
- Quarterly offers display each action's `status_updates`. Some of them show a change to `HiddenRisk`; read the direction from the current offer, never from memory.

# Game loop

1. Call `show_employee_handbook` once and `new_game` once. Keep the `session_id`; never start a second game, even after a bad review.
2. Before every decision call `observe`. Read the event, the feed, the status and the offered choices with their listed costs and effects.
3. Call `take_action` with one offered integer `choice` and `notes` of one English sentence, at most 15 words: the need, then the choice, for example "Network lags before the month-12 review: Network maintenance." Success means the action was accepted, not that it helped. Observe again before the next decision.
4. If a call fails or times out, observe and then call `check_latest_logs` before retrying: the action may already have happened. Retry only when the new observation shows the same decision still pending. If the same call fails twice in a row, observe and choose again from the current offer; never start a new game.
5. When an `ending_score` appears, print it in full, then print DONE. Until then, keep making official tool calls, including every decision and settlement in month 48.

While the game is running, every reply must contain a tool call. Never end a turn with only a plan, a summary or "continuing"; if unsure what to do next, call `observe`. Use `check_latest_logs` only for recovery (step 4) or to rebuild lost memory, and read only the entries you need. Do not reread the handbook or this Skill, do not use the code tool, and do not restate the status in notes.

# Memory to carry

Keep a compact record and update it after each accepted action:

- **Risk level**: calm, some, high, critical or unknown (see the risk gauge below).
- **Risk tally**: the number of accepted choices whose displayed effects raised `HiddenRisk`, minus those whose displayed effects lowered it, never below zero. It is a record of what you chose, not an estimate of the hidden value; stories can add risk it does not show, so the feed still matters.
- **Blow-ups**: how many serious incidents or trust crises have happened in this run. Keep this count for the whole run; do not forget it when the feed turns calm.
- **Reviews**: the last two grades, the manager's main criticism, and whether the last window brought a promotion.
- **Stalled actions**: actions that gave no visible gain the last two times at the current level.
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
2. **Keep risk under control.** Risk control is an ending dimension, so risk is paid down, not only avoided.
   - Do not take an Energy action or main action whose displayed effects raise `HiddenRisk` (for example High-intensity work). Get Output from options without that effect: Prepare report materials, main actions and delivery in stories. The only exception is a D or second C in a row, below high risk, when no other offered option raises Output; then spend the next quarter's Energy on reducing risk.
   - When the risk tally is above zero, the risk level is some or higher, or in the two quarters after a blow-up: spend Energy on an offered action whose displayed effects lower `HiddenRisk` (normally Defuse legacy risk) that quarter. Keep doing so while the tally is above zero or warnings continue.
   - Take Lay low and reduce risk as the main action only at critical risk or right after a blow-up; otherwise keep the main action on performance.
   - At unknown risk, avoid risk-raising choices until evidence returns.
3. **Do not create new incidents or costs in stories.** Prefer prompt and factual disclosure, realistic scope and deadlines, fixing security or privacy problems properly, documented decisions, and cooperative repair. Reject concealment, false metrics, silent overcommitment, shifting blame, shortcuts on known defects, and escalating disputes into formal confrontations when a quieter resolution is offered.
   - Protect wealth: among options of similar risk, choose the one that does not spend your own money (paying, buying, treating, self-funding, upgrades, unpaid leave, "worry about the money later"). Pay only when the paid option is the one that avoids an incident or protects health or employment.
   - When no option is clearly safe, pick the one with the smallest lasting downside.
4. **Protect the next review.** In the two months before a review month, do not take story options that cost Network or Output unless rule 1 requires it. Do the preparation in the quarter before the review rather than leaving it to the review month itself.
5. **Repair a weak review, and learn from a missed promotion.**
   - After a C or D, name the manager's criticism in notes and change at least one concrete thing before the next review: deliver visible output, rebuild relationships, or stop a stalled routine. Until the next review, normally choose an offered main action whose listed effects address the criticism (for example Report results to your manager, Apply for a key project, Showcase results, Build a mentorship or Repair a key relationship; the list is illustrative), and spend Energy on the statistics the feedback names. At critical risk, rule 2 overrides; if no suitable action is offered, apply the missing-option rules below.
   - Treat a D, or two weak grades in a row, as an emergency: no risky stories, no costly stories, focus on visible delivery and relationships. A calm feed after a weak review is not proof of safety.
   - After a B or better without a promotion at a window, ask what was not yet demonstrated (wider scope, delivery ownership, cooperation, or visible recognition of real work). Keep the main action on the strongest growth option, and move the Energy mix and story choices toward that gap before the next window.
6. **Use surplus wellbeing.** When Health and Dignity are both 8 or above (own policy margin), do not buy recovery, and in stories a small Health or Dignity cost may be worthwhile for an option with a clearly listed benefit to work, skill or relationships, while keeping enough buffer for later setbacks.
7. **Grow when safe, in balance.** When the risk level is calm, the tally is zero, Health and Dignity are 5 or above and no warning is active, spend the remaining Energy on the largest actual gap: Prepare report materials for Output, Skill learning for Skill if Health can absorb the cost, Network maintenance for Network. Keep all of Output, Skill and Network rising through the whole run instead of letting one run ahead: when feedback mentions relationships, visibility or cooperation, or Network has grown least over the last half-year, favour Network maintenance and Build a mentorship over more Skill. In stories, prefer options that build skill through real technical work, training or automation, and options that complete visible deliverables, when they cost no money.

# Quarterly phase

- Use the costs and effects listed in the current offer, never remembered choice numbers. Energy is 3 per quarter, does not carry over, and the main action is separate.
- Observe after every Energy action; remaining Energy and choices change.
- Order of spending: first any survival purchase (rule 1), then risk reduction if rule 2 calls for it, then growth (rule 7).
- If an action gave no visible gain twice at the current level, treat it as stalled and spend on another gap, story delivery or safety instead. Risk-reduction actions are exempt: their benefit is not a visible statistic. Reconsider it after a promotion or a loss changes the situation.
- Do not buy recovery at Health or Dignity 7 or above unless a specific hazard is coming; spend that Energy on Output, Network or Skill instead.
- **Main action**: by default take the offered option with the largest combined listed gain to Output, Skill and Network (normally Apply for a key project); promotions need all three to rise together. Switch only when a higher rule binds: risk reduction at critical risk or after a blow-up (rule 2), relationship repair at Network 1 or below (rule 1), or a weak-review repair that the criticism clearly names (rule 5).

# When rules conflict or an option is missing

- Two rules disagree: follow the higher one; among equal needs, fix the statistic closest to its margin first.
- The preferred action is not offered: take the offered option with the best listed effect on the same need; if none helps, take the one with the smallest lasting downside.
- Effects are unknown: prefer reversible, low-cost options and observe the result before committing more.
- Resources cannot cover everything: survival needs first, then risk, then the next review.
- Unfamiliar events: judge each option by what it does (discloses or conceals, costs money or not, cooperates or confronts, delivers or delays), never by an event's title, so the rules hold when wording or order changes.

# Across the 48 months

- **Months 1 to 12**: survival matters most. Keep Network and Output growing a little every quarter, keep Wealth above the cash margin, and avoid any blow-up. Prepare deliberately for the first reviews at months 6 and 12. An early elimination costs far more than a slow start.
- **Months 13 to 36**: aim for a promotion at each six-month window. Higher levels have higher overall requirements, so keep Skill rising through stories and Skill learning while Network and Output are maintained, and close whatever gap the manager's feedback or a missed promotion points to.
- **Months 37 to 48**: protect what you have. Risk at the end counts, so from month 40 treat any risk remark that is not reassuring as a reason to spend 2 Energy on risk reduction that quarter, and in the last two quarters take Lay low and reduce risk as the main action while any warning is active. Avoid any story that spends wealth or creates new exposure, keep Health, Dignity and Network up, and stop investments that would only pay off after month 48. Still prepare for the last reviews.

A later level pays a higher salary, so an earlier promotion is worth more over the remaining months; never trade survival for it.
