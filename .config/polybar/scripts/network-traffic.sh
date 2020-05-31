#!/bin/sh

# Module showing network traffic. Shows how much data has been received (RX) or
# transmitted (TX) since the previous time this script ran. So if run every
# second, gives network traffic per second.

logfile="${XDG_CACHE_HOME:-$HOME/.cache}/netlog"
[ -f "$logfile" ] || echo "0 0" > "$logfile"
read -r rxprev txprev < "$logfile"

rxcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/rx_bytes)))"
txcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/tx_bytes)))"

up=$(((txcurrent-txprev)/1024))
down=$(((rxcurrent-rxprev)/1024))

if (( $up > 1024 || $down > 1024 )); then
    printf " %dMiB   %dMiB" "$(($up/1024))" "$(($down/1024))"
else
    printf " %dKiB   %dKiB" "$up" "$down"
fi

echo "$rxcurrent $txcurrent" > "$logfile"
