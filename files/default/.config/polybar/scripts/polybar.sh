#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar top_DP-1-1-2-1-1 &
polybar top_DP-1-1-2-1-8 &
polybar top_DP-1-1-2-8 &
polybar bottom_DP-1-1-2-1-1 &
polybar bottom_DP-1-1-2-1-8 &
polybar bottom_DP-1-1-2-8 &

echo "Bars launched..."
