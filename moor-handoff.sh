#!/bin/sh
# Dos Moos: hand the login intro over to the animated moor loop.
#
# Omarchy plays a background intro only before a still, so hyprland.lua saves
# the moor still as the background when the session ends, and starts this at
# login. Once Omarchy's intro has played, switch to the loop. The still is the
# intro's last frame and the loop's first, so the switch doesn't show.
#
# Usage: moor-handoff.sh <loop.mp4>

loop="$1"
state="${XDG_STATE_HOME:-$HOME/.local/state}/omarchy"
[ -f "$loop" ] || exit 0

intros_off() {
  [ -f "$state/toggles/background-intros-off" ] ||
    [ "$(hyprctl -j getoption animations:enabled 2>/dev/null | jq -r .bool 2>/dev/null)" = false ]
}

# Wait for the intro to start and then to finish. With intros off, or if none
# plays within 30 seconds, go straight to the loop.
if ! intros_off; then
  deadline=$(($(date +%s) + 30))
  started=false
  while [ "$(date +%s)" -lt "$deadline" ]; do
    playing=$(owe status 2>/dev/null | jq -r '.intro' 2>/dev/null)
    if [ "$playing" = true ]; then
      started=true
    elif [ "$started" = true ]; then
      break
    fi
    sleep 0.2
  done
fi

exec omarchy-theme-bg-set "$loop"
