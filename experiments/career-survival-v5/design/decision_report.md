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

A later review of all local games that reached L4 showed where time was lost after the early levels:

| Pattern seen in test runs | Change |
|---|---|
| At L4, Network and Output stopped rising early, so only Skill was still growing. About 87% of the Skill gained at that level came from story choices, 11% from the main action and 2% from Energy. Runs that gained less Skill per story at L4 needed an extra review window to be promoted, and two finished the game at L4. Meanwhile most Energy went to Prepare report materials although Output no longer rose, and the main action was almost always the key project, while the action listed as raising Skill strongly was chosen once. | Skill phase: once Network and Output are observed to be full, prefer Skill-building story options, the main action listed as mainly raising Skill, and Skill learning for Energy, below the survival, risk, incident, review and repair rules. |

An earlier attempt moved Energy to Skill from the start of the run and slowed the first promotions, so this phase starts only after Network and Output are observed to be full.

The four-Skill design with a code helper used about 61M input tokens per full game. The previous single-Skill risk-first design used about 38M with similar or better scores, which is why this version keeps one Skill and no code.

## Principal risks

- **Hidden rules.** Promotion and failure conditions are not published; the margins may be too cautious or not cautious enough.
- **Model compliance.** The agent may skip a rule or misread a remark. The ordered priorities and short notes make its reasoning visible in the logs, but cannot force it.
- **Over-caution.** Strong risk avoidance can slow promotions. The "grow when safe" rule and the 48-month plan limit this.
- **Skill-phase misreading.** The agent may mark a statistic full after one unlucky action, or neglect Network and Output once in the skill phase. A fall in either ends the phase until it is restored, and the review protection still applies.
- **Variance.** Three official runs are averaged, and local runs vary widely, so the design targets consistency over a high best case.

## Generalisation beyond the development dataset

Every rule is written in terms of public statistics, grades, listed choice effects and the tone of feedback, never event titles, wording or order. The stalled-action and full-statistic checks measure the effect of actions in the current run, so they adapt if parameters change; the skill phase names no level, value or event, only the observed fact that two statistics stopped rising. The margins are conservative buffers on the published scales, chosen by judgement after testing; they are not fitted thresholds and the Skill labels them as policy.
