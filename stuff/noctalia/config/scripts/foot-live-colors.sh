#!/usr/bin/env bash
COLORS_FILE="$HOME/.cache/noctalia/foot-colors.ini"
[[ -f "$COLORS_FILE" ]] || exit 0

get_color() {
    awk -v key="$1" '
        /^\[colors-/ { in_s=1; next }
        /^\[/ { in_s=0 }
        in_s && $0 ~ "^" key "=" { split($0, a, "="); print a[2]; exit }
    ' "$COLORS_FILE"
}

osc=""
osc+="\033]11;#$(get_color background)\007"
osc+="\033]10;#$(get_color foreground)\007"
for i in 0 1 2 3 4 5 6 7; do
    osc+="\033]4;$i;#$(get_color "regular$i")\007"
done
for i in 0 1 2 3 4 5 6 7; do
    osc+="\033]4;$((i+8));#$(get_color "bright$i")\007"
done

for foot_pid in $(pgrep -x foot 2>/dev/null); do
    for child_pid in $(ps --ppid "$foot_pid" -o pid= 2>/dev/null); do
        tty_name=$(ps -p "$child_pid" -o tty= 2>/dev/null | tr -d ' ')
        [[ -z "$tty_name" || "$tty_name" == "?" ]] && continue
        printf '%b' "$osc" > "/dev/$tty_name" 2>/dev/null || true
    done
done
