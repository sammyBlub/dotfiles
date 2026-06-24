CHOICE=$(cliphist list | wofi --dmenu --prompt "Clipboard history")
[ -z "$CHOICE" ] && exit 0

CONTENT=${CHOICE#*[0-9]}
CONTENT=$(printf '%s\n' "$CHOICE" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//')

printf '%s' "$CONTENT" | wl-copy
printf '%s' "$CONTENT" | wl-copy --primary
