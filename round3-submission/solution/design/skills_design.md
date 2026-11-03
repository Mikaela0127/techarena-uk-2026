# Skills design

## One Skill, read once

The submission has a single Skill, `career-survival`. Earlier versions split the work across four Skills (observer, risk, planner, decision) plus a Python ledger helper. In our local games that design used about 1.3M input tokens per game month, and the helper was called inconsistently. Every Skill and every code-tool call adds text to the context that is carried through all later turns, so one compact Skill loaded once is cheaper and leaves the model fewer places to contradict itself. The token-efficiency part of the score rewards this directly.

## Sections and their responsibilities

| Section | Responsibility | Information used |
|---|---|---|
| Game loop | One session, observe before every decision, one offered integer choice per `take_action`, a tool call in every reply, recovery after a timeout, stop at `ending_score`. | `observe`, `take_action`, `check_latest_logs`, `new_game`, `show_employee_handbook` |
| Memory to carry | A five-item record (risk level, blow-up count, last two reviews, stalled actions, next review month) instead of a copy of the state. | The agent's own notes and the latest observation |
| Risk gauge | Turns the tone of HR, manager and colleague remarks into one of five levels, and raises the level when a chosen option lists a risk-increasing effect. | Feed text, offered choice effects |
| Decision priorities | Seven ordered rules; a higher rule overrides a lower one unless a rule states an exception. Each rule says what to do near a limit. | Visible statistics, review grades, the risk level |
| Quarterly phase | How to spend 3 Energy and the main action: listed costs only, re-observe after each action, stop repeating stalled actions, gate high-intensity work. | Offered costs and effects, the stalled-action record |
| When rules conflict or an option is missing | Tie-breakers: higher rule first, the statistic closest to its margin, the best listed effect on the same need, reversible options when effects are unknown. | Offered choices and their listed effects |
| Across the 48 months | What each third of the run is for: survive the first year, climb in the middle, protect and accumulate at the end. | Current month, level, wealth |
| Ending dimensions: wealth and risk | Prefer free story options of similar risk; from month 40, clear risk warnings with Defuse and, in the last two quarters, Lay low. | Story option wording, feed remarks, current month |
| After a blow-up | After the first serious incident, treat every later risk remark as critical: Defuse plus Lay low that quarter; most conservative honest story options. | Blow-up count, feed remarks |
| Before a review | In the two months before a review, prefer story options that keep delivery moving and settle disagreements privately; restore Output or Network if a story has just lowered them. | Next review month, observed Output and Network |

## How the parts combine into one decision

For each decision the agent reads the observation, updates the memory, checks the priorities from the top, and takes the first rule that applies. Repeated weak reviews are a published failure route, so after a D or a second C in a row, review repair is promoted to the survival level. Only when no survival, risk, incident, review or repair rule applies does it reach "use surplus wellbeing" and "grow when safe", where it spends on the largest actual gap. The 48-month section adjusts what "gap" means: Network and Output early, Skill and promotions in the middle, risk and wealth near the end.

## Design choices

- **Safety margins are policy, not mechanics.** The Skill says, for example, "Health 4 or below: buy Health recovery". The handbook publishes the 0–10 range and that Health 0 ends the run, but no other threshold; the margin exists so the agent acts before a problem becomes a failure, and it is labelled as our policy.
- **Tone, not wording.** The risk gauge describes the meaning of a remark, not its words, so it still works if the event text or language changes.
- **Measured gains, not expected ones.** "Stalled actions" are judged by the observed change after an action. This adapts automatically if action effects differ from earlier runs.
- **No code.** Nothing in the strategy needs computation beyond comparing small numbers, so no script is shipped.

## What changed in this version

This version keeps the earlier Skill's text and adds four small pieces, each answering a failure seen in our own test games on the competition model:

- **A tool call in every reply.** In one run the agent repeatedly ended its turn with a sentence such as "Let me observe the next state" instead of calling the tool; the runner's continuation limit was used up by month 7 and the run had no score.
- **No confidential information, no silence.** Two runs ended with a second blow-up right after the agent hinted at an unpublished restructure to a colleague, and others after options such as "say nothing" or "leave it there" about something wrong; rule 3 now says both explicitly, and staying silent about misconduct or harm counts as concealment.
- **Before a review.** At a level where Output and Network have stopped rising, a single point lost to a story just before a review was often enough to miss the promotion, and two missed reviews end the run. The new section asks the agent to prefer options that keep delivery moving in the two months before a review.
- **Ending protection.** Wealth and risk control are ending dimensions, so free options are preferred in stories and risk warnings are cleared in the final year.

We deliberately did not add more. Several richer variants we tested, with more rules or with the key rules repeated in the instruction, did worse: the extra text changed how the model weighed story options, for example pushing it towards slow, thorough options that cost Output just before reviews.
