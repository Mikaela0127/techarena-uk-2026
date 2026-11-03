# Decision report

## Overall approach

Survival is a constraint, not one goal among many. An early exit is scored from the state at exit and also caps token efficiency, while the official live-play score is the mean of three runs, so one elimination costs more than any single promotion can earn. The agent therefore applies seven ordered priorities: avoid immediate failure, cut accumulating risk, avoid creating incidents in stories, protect the next review, repair a weak review, use surplus wellbeing, and only then grow. Repeated poor reviews are themselves a published failure route, so after a D or a second weak grade in a row, review repair is treated as survival. Within survival it aims for a promotion at each six-month window, because a higher level pays a higher salary for every remaining month and career level and wealth are both ending dimensions.

## Information relied on

- **Public handbook and rules**: the 48-month structure, the six-month review and promotion windows, the 0–10 range of Health and Dignity, Health 0 ending the run, the published failure directions, the Energy costs and action effects, the salary schedule, the review grades and the six ending dimensions.
- **In-run feedback**: the offered choices and their listed costs and effects, review grades and the manager's comments, warnings and the tone of HR and colleague remarks, and the actual change in statistics after each action.

No event name, quoted event text, development-dataset threshold or score formula is used.

## What the debugging showed, and what changed

We played 26 local games with ending reports across several team designs, plus reviews of teammates' runs. Completed games averaged about 66; nine were eliminated, seven of them at L1. Reading the logs of the eliminated runs showed recurring patterns, each turned into a general rule:

| Pattern seen in eliminated runs | Rule in the Skill |
|---|---|
| Small optional purchases in stories, combined with a weak review, drained wealth below zero. | Wealth margin: refuse optional costs when savings are low. |
| A story choice just before a review cost Network or Output, and the promotion was missed. | Protect the next review: no Network or Output losses in the two months before it. |
| Warnings were noticed but acted on late; a second incident ended the run. | Risk gauge plus a blow-up count that never resets; cut risk while warnings continue. |
| The agent repeated an action that had stopped producing gains, or used high-intensity work after an incident. | Stalled-action record; a strict gate on high-intensity work. |
| A C grade was treated as safe and the same routine continued. | Weak-review repair: name the criticism and change something concrete. |

Testing this Skill on the current simulator version exposed two more problems, fixed in the following version:

| Pattern seen in test runs | Change |
|---|---|
| After weak reviews the agent kept choosing the risk-reduction main action, the next review was weaker still, and the run ended with a dismissal for repeated weak reviews. | After a weak review the main action must target performance; risk reduction as the main action is reserved for critical risk. |
| Health and Dignity sat at their maximum for most of both runs, while output and network stayed low. | Use surplus wellbeing: well above the margins, a small wellbeing cost may be worth a clearly listed benefit to work, skill or relationships, while keeping a buffer. |

The four-Skill design with a code helper used about 61M input tokens per full game. The previous single-Skill risk-first design used about 38M with similar or better scores, which is why this version keeps one Skill and no code.

## Testing on the competition model, and what changed

Our first official result was well below our local average, so before this version we played about forty further games on the unmodified official runner: some with the designated competition model and many more with a second model on our own key, which is cheaper but behaves differently. Reading the event logs of the failed runs showed three ways a run ends early, all of them more frequent on the competition model:

| Failure seen in the logs | Change in this version |
|---|---|
| The agent ended its turn with text such as "Let me observe the next state" instead of a tool call, until the runner's continuation limit ended the run with no score. | Every reply during the game must contain a tool call. |
| A second blow-up or trust crisis ended the run; twice it came right after the agent hinted at confidential plans to a colleague, other times after it chose to say nothing about a problem, and the agent did not switch to risk reduction after the first incident. | Rule 3 forbids sharing or hinting at confidential information and treats staying silent about misconduct or harm as concealment; after a blow-up, every later risk warning is treated as critical. |
| Promotions were missed at the early reviews although the agent had invested correctly, because a story option in the two months before the review lowered Output or Network. Two missed reviews then led to dismissal. | In the two months before a review, prefer options that keep delivery moving and relationships intact, and restore a statistic a story has just lowered. |

With the own-key model, this version completed all 8 of its test games (mean 63.0, range 50.6 to 78.3, including our only game that reached L6), and 6 of 8 were promoted at the first review, against 5 of 14 with the earlier Skill. On the competition model we limited ourselves to two games per variant to save the shared credit, so the evidence there is thin: one run completed with 68.56; in the other the agent never loaded the Skill at all, played from the short instruction alone, ignored its final-year risk warnings and was dismissed in month 47. That failure is outside what the Skill text can control.

We also learned what not to do. Variants that added more rules, moved the key rules into the instruction, or asked for very short replies to save tokens all did worse or were followed inconsistently. A Skill reliably shapes behaviour only when its additions are few and concrete, so this version keeps the earlier text and adds only what the logs showed was missing.

## Principal risks

- **Hidden rules.** Promotion and failure conditions are not published; the margins may be too cautious or not cautious enough.
- **Model compliance.** The agent may skip a rule or misread a remark. The ordered priorities and short notes make its reasoning visible in the logs, but cannot force it.
- **Over-caution.** Strong risk avoidance can slow promotions. The "grow when safe" rule and the 48-month plan limit this.
- **Variance.** Three official runs are averaged, and runs vary widely: on the competition model roughly half of our test games of every variant ended early, so a single bad run can dominate the official mean. The design targets avoiding the early-exit routes rather than a high best case.

## Generalisation beyond the development dataset

Every rule is written in terms of public statistics, grades, listed choice effects and the tone of feedback, never event titles, wording or order. The stalled-action check measures the effect of an action in the current run, so it adapts if parameters change. The margins are conservative buffers on the published scales, chosen by judgement after testing; they are not fitted thresholds and the Skill labels them as policy.
