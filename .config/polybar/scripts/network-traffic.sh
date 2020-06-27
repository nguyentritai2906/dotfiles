#!/bin/sh

# Module showing network traffic. Shows how much data has been received (RX) or
# transmitted (TX) since the previous time this script ran. So if run every
# second, gives network traffic per second.

logfile="${XDG_CACHE_HOME:-$HOME/.cache}/netlog"
[ -f "$logfile" ] || echo "0 0" > "$logfile"
read -r rxprev txprev < "$logfile"

rxcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/rx_bytes)))"
txcurrent="$(($(paste -d '+' /sys/class/net/[ew]*/statistics/tx_bytes)))"

up=$(((txcurrent-txprev)/1000))
down=$(((rxcurrent-rxprev)/1000))

if (( $up > 1000 || $down > 1000 )); then
    printf " %dMB   %dMB" "$(($up/1000))" "$(($down/1000))"
else
    printf " %dKB   %dKB" "$up" "$down"
fi

echo "$rxcurrent $txcurrent" > "$logfile"
