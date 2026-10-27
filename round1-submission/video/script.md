# Presentation script (as recorded for the 27 October submission)

One team member reads this on camera. `slides.json` holds the slides shown beside the speaker; the
composite was built with `candidates/Mikaela0127/tools/video/compose.swift`. Pause about two seconds
at each `---` so the slide changes can be cut there.

---

Hello, we are team Hachimi Mambo, and this is our Career Survival Agent. Our submission is one Skill,
called career-survival. We will answer the five questions in order.

---

Question one: how did we think while designing the Skill?

We started from the scoring. An early exit is scored from the state at the moment of exit, so one
elimination costs more than a promotion can earn. That is why survival comes first.

The Skill gives the agent seven priorities in a fixed order: avoid failure, cut risk, avoid new
incidents, protect the next review, repair a weak review, use spare health and dignity, and only then
grow. A higher rule wins, so the agent never has to weigh everything at once.

Every number in the Skill is our own safety margin, and the Skill says so clearly. We also planned
across the forty-eight months: survive first, then climb, then protect what we have.

---

Question two: what did the logs show, and what did we change?

We played twenty-six local games and read the log of every elimination. Nine games were eliminated,
most of them at the first level.

We saw three main patterns. Small optional purchases drained wealth, so we added a cash margin. A
story choice just before a review cost a promotion, so we now protect the months before each review.
And warnings were acted on too late, so we added a risk gauge and a count of serious incidents that
never resets.

On the current simulator, one run was dismissed after two weak reviews, because the agent kept
reducing risk instead of improving its work. Now, after a weak review, the main action targets the
manager's criticism.

Finally, one compact Skill used about forty percent fewer tokens than our four-Skill design, with
similar results. With this version, six local games all completed the forty-eight months.

---

Question three: why no scripts or reference files?

An earlier version had a Python helper, but the agent called it inconsistently, and every call filled
the context. The decisions only need simple comparisons, which the model can do directly. So the final
Skill is one short document, with no code.

---

Question four: how general and robust is the Skill?

Every rule uses public information only: the visible statistics, review grades, the effects listed on
each choice, and the tone of feedback. Nothing depends on event names or wording. Our safety margins
sit on published scales, and the agent judges actions by what it actually observes. So if the
environment changes, the agent can still adapt.

---

Question five: what did we learn about agents and Skills?

The model is capable but inconsistent. A Skill gives it a stable way of working, and carries lessons
from earlier runs into a new game. We learned that short and ordered works better than long and
complete. But a Skill cannot force the model to follow it, or remove randomness. It makes the agent's
judgement more consistent.

---

Thank you for watching.
