# Experiments

The variants I kept from after the round-1 submission, each with its own `TESTS.md` (what changed, every game
played, and why it was kept or dropped). Paths written as `official/solution/` inside these files refer to
what is now `round1-submission/solution/` (v2).

Scores are the simulator's `quantitative_score` for one 48-month game. "Own key" means a cheaper model on
our own API key; "competition key" means the official evaluation model. The two are not directly
comparable, and single games vary by 20 to 40 points, so each table lists every game, not the best one.

| Folder | What it tests | Outcome |
|---|---|---|
| `career-survival-v3`, `v4` | Energy rules for capped statistics; restoring statistics below their level best | Rejected |
| `career-survival-v5` to `v7` | A skill phase once Network and Output stop rising; review protection; reading grades with outcomes | Not adopted |
| `career-survival-v8` | Scope section and clearer rule layout, SKILL.md only | Not adopted |
| `career-survival-v15`, `v15b` | Risk tally from listed effects; wealth guard; missed-promotion handling | Dropped |
| `career-survival-v16`, `v17` | Ending dimensions (wealth and risk); plateau handling | Dropped |
| `career-survival-v19`, `v20` | Pre-review protection; confidentiality; after-a-blow-up caution | Merged into v21 |
| `career-survival-v21` | v20 plus "every reply must contain a tool call" | Basis of the final line |
| `career-survival-v21b`, `v21c` | Rewording the pre-review rationale (softened vs concrete) | Concrete wording kept |
| `career-survival-v21d` | v21c plus "staying silent counts as concealment" | Final candidate (`round3-submission/`) |
| `career-survival-v21e`, `v21f` | Spending stalled Energy on Skill learning | Dropped: 2 Energy for +1 Skill |
| `career-survival-v21g` | v21d plus "the first tool call must load the Skill" | Alternative to v21d |
| `career-survival-v22` to `v26` | Rules moved into the manifest; minimal changes; L6 attempts; short replies | Dropped |
| `tools/run_games.sh` | Plays several games in a row and appends one row per game to a results file | |
| `tools/quarterly.py` | Lists the quarterly choices of one game from its event log | |
| `tools/video/` | `compose.swift` builds the presentation (slides plus the speaker's camera); `pauses.swift` finds section pauses in a recording | |

`tools/video/*.swift` use only macOS frameworks. Compile `compose.swift` as `main.swift` with
`swiftc -O main.swift -o compose`; the `swift` interpreter crashes on it.
