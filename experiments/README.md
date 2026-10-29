# Mikaela0127: candidates and tools

Owner: Mikaela0127. The version that was submitted lives in `official/`; this folder holds the
rest.

| Folder | What it is |
|---|---|
| `career-survival-v3/` | v2 plus Energy rules for capped statistics. Rejected: 65.34, 55.48 (see `TESTS.md`) |
| `career-survival-v4/` | v3 plus restoring statistics below their level best. Rejected: 61.99, 65.55 |
| `career-survival-v5/` | v2 plus a skill phase once Network and Output stop rising. Not adopted: 19.23 (eliminated at L1), 57.84 (competition key) |
| `career-survival-v6/` | v2 with the review-protection rule rewritten: cooperative story options before a review, win back a loss. Not adopted: 58.33, 54.20 (competition key) |
| `career-survival-v7/` | v2 with grades read with their outcome and stalled Energy actions excluded (from a Codex discussion). Not adopted: 58.80, 64.55, 51.36, 44.30 eliminated (competition key) |
| `A-risk-first/`, `merged-v1/`, `merged-v2/` | Candidates from 20 October, engine 1.0.5. Not compliant with the rules published on 26 October |
| `analysis/` | Log analysis behind the 20 October handover (engine 1.0.5); `REPORT.md` is the summary |
| `tools/run_games.sh` | Plays several games in a row and appends one row per game to a results file |
| `tools/timeline.py`, `tools/quarterly.py` | Per-month timeline and quarterly choices of one game |
| `tools/video/` | `compose.swift` builds the presentation (slides plus the speaker's camera); `pauses.swift` finds section pauses in a recording |
| `HANDOVER-2026-10-20.md` | Handover of the 20 October local evaluation |

`tools/video/*.swift` use only macOS frameworks. Compile `compose.swift` as `main.swift` with
`swiftc -O main.swift -o compose`; the `swift` interpreter crashes on it.
