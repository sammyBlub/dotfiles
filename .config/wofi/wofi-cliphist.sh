CHOICE=$(cliphist list | wofi --dmenu --prompt "Clipboard history")
[ -z "$CHOICE" ] && exit 0
printf "%s" "$CHOICE" | wl-copy
printf "%s" "$CHOICE" | wl-copy --primary
