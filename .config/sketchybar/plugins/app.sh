#!/usr/bin/env bash


main() {
    local label
	label="$(lsappinfo -all list | grep "$1" | grep -Eo "\"StatusLabel\"=\{ \"label\"=\"?(.*?)\"? \}" | sed 's/\"StatusLabel\"={ \"label\"=\(.*\) }/\1/g')"

	if [[ ! "$label" =~ ^\".*\"$ ]]; then
        return
    fi
    label="$(echo "$label" | sed 's/^"//' | sed 's/"$//')"
    if [ -z "$label" ]; then
        return
    fi
    sketchybar --set "$NAME" label="$label"
}


if [ "$SENDER" = 'routine' ]; then
    main "$@"
fi
