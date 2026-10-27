#!/bin/bash
# Play one game per argument and append one TSV row per game to results.tsv.
# Usage (from the official kit root, with .env filled and `make start-jiuwen` running):
#   bash <repo>/candidates/Mikaela0127/tools/run_games.sh <solution-dir> [<solution-dir> ...]
set -u
RESULTS="${RESULTS:-results.tsv}"
[ -s "$RESULTS" ] || printf 'game\tsolution\tstart\tend\toutcome\tmonths\tscore\tgrade\tlevel\tinput_tokens\toutput_tokens\toutput_dir\n' > "$RESULTS"
n=$(( $(wc -l < "$RESULTS") - 1 ))
failed=0
for sub in "$@"; do
  n=$((n+1)); log="game-$n.log"; start=$(date '+%H:%M:%S')
  # A fresh RESULTS file restarts numbering; never overwrite an earlier game's log.
  if [ -e "$log" ] || [ -L "$log" ]; then echo "refusing to overwrite $log; move it or use another directory" >&2; exit 2; fi
  # UV_NO_SYNC keeps engine 1.0.5; plain `uv run` re-syncs to the delisted 1.0.2 in uv.lock.
  UV_NO_SYNC=1 uv run python -m career_sim_runner play --submission "$sub" > "$log" 2>&1
  rc=$?
  end=$(date '+%H:%M:%S'); dir=$(grep -m1 '^output_dir:' "$log" | sed 's/^output_dir: //')
  if [ "$rc" -ne 0 ] || [ -z "$dir" ]; then
    printf '%s\t%s\t%s\t%s\tplay_failed:%s\t\t\t\t\t\t\t%s\n' "$n" "$sub" "$start" "$end" "$rc" "$log" >> "$RESULTS"
    failed=1; continue
  fi
  python3 - "$dir/score_report.json" "$n" "$sub" "$start" "$end" "$dir" >> "$RESULTS" <<'PY'
import json, sys
path, n, sub, start, end, d = sys.argv[1:]
try:
    r = json.load(open(path))
except Exception as exc:
    print("\t".join([n, sub, start, end, f"no_report:{type(exc).__name__}"] + [""] * 6 + [d])); sys.exit(1)
e = r.get("ending_score") or {}
lvl = next((x.get("raw_value") for x in e.get("dimensions", []) if x.get("name") == "level"), "")
u = r.get("token_usage") or {}
print("\t".join(str(x) for x in [n, sub, start, end, e.get("outcome", r.get("termination_reason")),
      e.get("survival_months", ""), e.get("quantitative_score", ""), e.get("grade", ""), lvl,
      u.get("input_tokens", ""), u.get("output_tokens", ""), d]))
PY
  [ $? -eq 0 ] || failed=1
done
exit "$failed"
