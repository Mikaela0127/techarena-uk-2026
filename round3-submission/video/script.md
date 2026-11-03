# Presentation script: Career Survival v21d (on camera)

Recording checklist:

- At least one team member is on camera and speaks. English only, normal speed, at most 10 minutes.
  The script runs about 6 to 7 minutes.
- Show `slides.pdf` full screen, with the speaker's camera in a corner, or film the speaker in front of
  the slides. Each `[Slide N]` cue marks when to move on.
- One take or several clips are both fine. Pause between sections so they can be cut.
- Answer the five questions in this order. Do not skip one. Do not speed the video up.
- Export as `presentation.mp4`. If the file is large, lower the resolution, not the speed.

---

## Opening (about 20 s)

[Slide 1]

Hello, we are team Hachimi Mambo. This is version twenty-one d of our Career Survival Agent.
It is a single Skill, called career-survival, running in JiuwenSwarm in single-agent mode, with no
scripts. We answer the five required questions in order.

## 1. How we thought while designing the Skill (about 90 s)

[Slide 2]

We started from the score. Eighty percent is the average of three full careers, so one early
elimination costs more than any single promotion can earn. Survival is therefore a constraint, not one
goal among many.

Our earlier versions split the work across four Skills and a Python helper. They used a lot of tokens,
and the agent often did not follow the pieces together. So we went back to one Skill that the agent
reads once, with a fixed order of priorities.

[Slide 3]

Every decision follows the same loop: observe, choose one offered option with a one-sentence note, then
observe again. The agent keeps only a small memory: the risk level, how many blow-ups it has had, its
last two reviews, which actions have stopped working, and the month of the next review.

Then it checks seven priorities from the top: avoid immediate failure, cut accumulating risk, create no
new incidents in stories, protect the next review, repair a weak review, use surplus wellbeing, and
only then grow. Every limit in the Skill is our own safety margin, written as policy, never as a
simulator threshold.

## 2. What the logs showed, and what we changed (about 2 min)

[Slide 4]

Our first official result was lower than our local average, so we played many more games on the
unmodified official runner and read the event logs of every run that ended early. We found three
routes to an early exit, and this version adds one small rule for each.

First, the agent sometimes ended its turn with a sentence like "Let me observe the next state" instead
of calling the tool. The runner's continuation limit then stopped the run with no score. The Skill now
says that every reply during the game must contain a tool call.

[Slide 5]

Second, a second blow-up ends the career. In the logs it came right after the agent hinted at
confidential plans to a colleague, or chose to say nothing about something it had seen, with options
such as "leave it there". So rule three now forbids sharing or hinting at confidential information, and
says that staying silent about misconduct counts as concealment: raise it through a proper channel.
And after a first blow-up, every later risk warning is treated as critical.

[Slide 6]

Third, missed promotions at the early reviews. The agent had invested correctly, but a story option in
the two months before the review cost one point of Output or Network, and that was enough to miss the
promotion. Two missed reviews then lead to dismissal. The new section asks the agent to prefer options
that keep delivery moving before a review, and to restore a statistic a story has just lowered.

Wording mattered here. When we softened the reason for this rule, only one game in four was promoted
at the first review. With the concrete sentence, six of eight were, against five of fourteen with the
earlier Skill.

[Slide 7]

Here are the results, on two models. On our own key, with a cheaper model, this version completed all
eight games of its first batch, with a mean of sixty-three, and one game reached the sixth level, the
only one in all our testing. A later batch on the same key went badly for both versions we ran then, so we
report it too. On the competition model we could only afford two games: one completed with sixty-eight
point six; in the other the agent never loaded the Skill at all. We come back to that in question five.

## 3. Scripts and reference files (about 50 s)

[Slide 8]

This version ships no scripts and no reference files, and the agent is told not to use the code tool.

That is a deliberate choice. Our previous version had a careful Python helper for exact checks, but in
our official-runner tests the model never called it. Every check the Skill needs, such as whether an
action actually changed a statistic, can be done by reading the next observation. So we wrote those
checks in plain language inside the Skill, where the agent always sees them. Fewer moving parts also
means fewer ways to fail.

## 4. How general and robust the Skill is (about 70 s)

[Slide 9]

Every rule is written in terms of public evidence from the current run: the visible statistics, review
grades, the costs and effects listed on each choice, and the tone of feedback. There are no event
titles, no story answers and no hidden thresholds.

Effects are measured, not assumed: an action that shows no visible gain twice at the current level is
treated as stalled, so the Skill adapts if action effects change. And the risk gauge reads the meaning
of a remark, not its exact words.

What would hurt us: a different review timetable would weaken the pre-review rule, and a model that
follows instructions less closely would skip some rules. The ordered priorities still give it a safe
default.

## 5. Agents and agent Skills (about 80 s)

[Slide 10]

A Skill gives a capable but inconsistent model a stable way of working: what to check first, what to
remember, and when to stop. It is also how lessons from old logs reach a fresh context.

But this competition showed us its limits. A Skill cannot force the agent to use it: in a few of our
games the agent never loaded the Skill and played from the short instruction alone. Wording matters as
much as rules: the same rule with a softer reason changed behaviour. And more is not better: our
variants with more rules did worse on the competition model.

So we see a Skill as a contract the agent mostly follows. We keep it short and concrete, and we test
every change by playing many games and reading the logs, not by reading the Skill.

## Closing (about 10 s)

[Slide 11]

Thank you for watching. That is our design, the evidence behind it, and what we learned.
