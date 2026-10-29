# Skills design

## One Skill, read once

The submission has a single Skill, `career-survival`. Earlier versions split the work across four Skills (observer, risk, planner, decision) plus a Python ledger helper. In our local games that design used about 1.3M input tokens per game month, and the helper was called inconsistently. Every Skill and every code-tool call adds text to the context that is carried through all later turns, so one compact Skill loaded once is cheaper and leaves the model fewer places to contradict itself. The token-efficiency part of the score rewards this directly.

## Sections and their responsibilities

| Section | Responsibility | Information used |
|---|---|---|
| Game loop | One session, observe before every decision, one offered integer choice per `take_action`, recovery after a timeout, stop at `ending_score`. | `observe`, `take_action`, `check_latest_logs`, `new_game`, `show_employee_handbook` |
| Memory to carry | A five-item record (risk level, blow-up count, last two reviews, stalled actions, next review month) instead of a copy of the state. | The agent's own notes and the latest observation |
| Risk gauge | Turns the tone of HR, manager and colleague remarks into one of five levels, and raises the level when a chosen option lists a risk-increasing effect. | Feed text, offered choice effects |
| Decision priorities | Seven ordered rules; a higher rule overrides a lower one unless a rule states an exception. Each rule says what to do near a limit. | Visible statistics, review grades, the risk level |
| Quarterly phase | How to spend 3 Energy and the main action: listed costs only, re-observe after each action, stop repeating stalled actions, gate high-intensity work. | Offered costs and effects, the stalled-action record |
| When rules conflict or an option is missing | Tie-breakers: higher rule first, the statistic closest to its margin, the best listed effect on the same need, reversible options when effects are unknown. | Offered choices and their listed effects |
| Across the 48 months | What each third of the run is for: survive the first year, climb in the middle, protect and accumulate at the end. | Current month, level, wealth |

## How the parts combine into one decision

For each decision the agent reads the observation, updates the memory, checks the priorities from the top, and takes the first rule that applies. Repeated weak reviews are a published failure route, so after a D or a second C in a row, review repair is promoted to the survival level. Only when no survival, risk, incident, review or repair rule applies does it reach "use surplus wellbeing" and "grow when safe", where it spends on the largest actual gap. The 48-month section adjusts what "gap" means: Network and Output early, Skill and promotions in the middle, risk and wealth near the end.

## Design choices

- **Safety margins are policy, not mechanics.** The Skill says, for example, "Health 4 or below: buy Health recovery". The handbook publishes the 0–10 range and that Health 0 ends the run, but no other threshold; the margin exists so the agent acts before a problem becomes a failure, and it is labelled as our policy.
- **Tone, not wording.** The risk gauge describes the meaning of a remark, not its words, so it still works if the event text or language changes.
- **Measured gains, not expected ones.** "Stalled actions" are judged by the observed change after an action. This adapts automatically if action effects differ from earlier runs.
- **Kinds of option, not events.** Story options do not list their costs. Before a review the Skill therefore steers by the kind of option (cooperative rather than refusing, private rather than public, planned work rather than side work), which carries over to events it has never seen.
- **No code.** Nothing in the strategy needs computation beyond comparing small numbers, so no script is shipped.
