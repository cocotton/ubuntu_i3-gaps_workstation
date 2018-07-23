#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar top_DP-1-2 &
polybar top_DP-2-2 &
polybar top_eDP-1 &
polybar bottom_DP-1-2 &
polybar bottom_DP-2-2 &
polybar bottom_eDP-1 &


echo "Bars launched..."
