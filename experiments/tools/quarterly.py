"""List quarterly energy/main actions chosen per month, with the displayed status_updates."""
import json, sys

def main(path, max_month=99):
    last = None
    for line in open(path):
        e = json.loads(line)
        d = (e.get("payload") or {}).get("delta") or {}
        if e.get("kind") == "tool_result" and str(d.get("tool_name", "")).endswith("observe"):
            try:
                last = json.loads((d.get("raw_output") or {}).get("result"))
            except Exception:
                pass
        if e.get("kind") == "tool_call" and d.get("tool_call", {}).get("name", "").endswith("take_action") and last:
            if e.get("payload", {}).get("delta_kind") != "custom":
                continue
            args = json.loads(d["tool_call"]["arguments"])
            ch = next((c for c in last.get("choices", []) if c.get("choice") == int(args.get("choice", -1))), None)
            if not ch or ("energy_cost" not in ch and "status_updates" not in ch):
                continue
            m = last["current_state"]["time"]["current_month"]
            if m > max_month:
                break
            print(f"m{m:>2} {ch.get('action')} cost={ch.get('energy_cost')} {ch.get('status_updates')}")

if __name__ == "__main__":
    main(sys.argv[1], int(sys.argv[2]) if len(sys.argv) > 2 else 99)
