#!/bin/sh
# Dos Moos: play the Moor intro at login, then hand over to the animated loop.
#
# When the session ends on the loop, hyprland.lua saves the intro clip as the
# background, so the next session starts by playing it as an ordinary video
# background. Switch to the loop just before the intro's last frame: a switch
# between two videos takes under 0.1 s, and the intro ends on the loop's first
# frame, so the motion carries straight on.
#
# Omarchy's own intro player isn't used. It won't play before a video
# background, and it holds the last frame for about a second while it fades to
# a still.
#
# Usage: moor-handoff.sh <intro.mp4> <loop.mp4> <switch-at-seconds>

intro="$1"
loop="$2"
switch_at="$3"
state="${XDG_STATE_HOME:-$HOME/.local/state}/omarchy"
[ -f "$loop" ] || exit 0

intros_off() {
  [ -f "$state/toggles/background-intros-off" ] ||
    [ "$(hyprctl -j getoption animations:enabled 2>/dev/null | jq -r .bool 2>/dev/null)" = false ]
}

# Position of the intro in seconds while it is the playing background.
intro_position() {
  owe render-status 2>/dev/null |
    jq -r --arg name "/${intro##*/}" 'select(.kind == "video" and (.path | endswith($name))) | .time_pos' 2>/dev/null
}

# Wait for the switch point, or for the clip to wrap around to its start if
# this started late. Give up after 20 seconds so the loop always comes.
if ! intros_off; then
  deadline=$(($(date +%s) + 20))
  last=-1
  while [ "$(date +%s)" -lt "$deadline" ]; do
    pos=$(intro_position)
    if [ -n "$pos" ]; then
      awk -v p="$pos" -v s="$switch_at" -v l="$last" 'BEGIN { exit !(p >= s || (l > 1 && p < l)) }' && break
      last=$pos
    fi
    sleep 0.03
  done
fi

exec omarchy-theme-bg-set "$loop"
