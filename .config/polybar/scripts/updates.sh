#!/usr/bin/env bash

BAR_ICON=""

get_total_updates() { UPDATES=$(eopkg ur > /dev/null && eopkg lu 2>/dev/null | wc -l) ; }

while true; do
    get_total_updates

    # when there are updates available
    # every 30 mins another check for updates is done
    while (( UPDATES > 1 )); do
		echo "$BAR_ICON $UPDATES"
        sleep 1800
        get_total_updates
    done

    # when no updates are available, use a longer loop, this saves on CPU
    # and network uptime, only checking once every hour for new updates
    while (( UPDATES == 1 )); do
		if [ "$(eopkg lu 2>/dev/null)" == "No packages to upgrade." ]; then
			echo "$BAR_ICON 0"
			sleep 3600
			get_total_updates
		else
			echo "$BAR_ICON $UPDATES"
			sleep 1800
			get_total_updates
		fi
    done
done
