#!/bin/bash

SINK=$(pacmd list-sinks | grep "index:" | grep '*' | awk '{print $3}')

if [ "$SINK" == "" ]; then
  SINK="0"
fi

if [ "$1" != "M" ]; then
  # pactl set-sink-volume "$SINK" "$1"
  pactl set-sink-volume "$SINK" "$1"  && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
else
  # pactl set-sink-mute "$SINK" toggle
  pactl set-sink-mute "$SINK" toggle  && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
fi
