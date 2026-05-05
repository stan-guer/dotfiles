#!/bin/sh

CONFIG="$HOME/.config/polybar/config"
BAR_NAME="${1:-fullbar}"

killall -q polybar 2>/dev/null || true

while pgrep -u "$(id -u)" -x polybar >/dev/null 2>&1; do
  sleep 0.2
done

monitors=""
if command -v polybar >/dev/null 2>&1; then
  monitors="$(polybar --list-monitors 2>/dev/null | cut -d: -f1)"
fi

if [ -z "$monitors" ] && command -v xrandr >/dev/null 2>&1; then
  monitors="$(xrandr --query 2>/dev/null | awk '
    $2 == "connected" {
      for (i = 3; i <= NF; i++) {
        if ($i ~ /^[0-9]+x[0-9]+[+-]/) {
          print $1
          break
        }
      }
    }')"
fi

if [ -n "$monitors" ]; then
  tray_position=right
  for monitor in $monitors; do
    MONITOR="$monitor" TRAY_POSITION="$tray_position" polybar -c "$CONFIG" "$BAR_NAME" &
    tray_position=none
    sleep 1
  done
else
  TRAY_POSITION=right polybar -c "$CONFIG" "$BAR_NAME" &
fi
