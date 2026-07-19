#!/bin/sh

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)"

if echo "$vol" | grep -q MUTED; then
    printf '{"text":"󰝟 muted","class":"muted"}\n'
    exit 0
fi

level=$(printf "%s" "$vol" | awk '{printf "%d", $2*100}')

if [ "$level" -lt 33 ]; then
    icon="󰕿"
elif [ "$level" -lt 66 ]; then
    icon="󰖀"
else
    icon="󰕾"
fi

printf '{"text":"%s %d%%"}\n' "$icon" "$level"
