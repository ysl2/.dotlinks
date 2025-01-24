#!/usr/bin/env bash
# Ref: https://github.com/AIboy996/dotfiles/blob/main/sketchybar/items/wechat.sh

main() {
    local label
    label="$(lsappinfo -all list | grep "$1" | grep -Eo "\"StatusLabel\"=\{ \"label\"=\"?(.*?)\"? \}" | sed 's/\"StatusLabel\"={ \"label\"=\(.*\) }/\1/g')"

    if [[ ! "$label" =~ ^\".*\"$ ]]; then
        sketchybar --set "$NAME" label=0 display=0
        return
    fi
    label="$(echo "$label" | sed 's/^"//' | sed 's/"$//')"
    if [ -z "$label" ]; then
        sketchybar --set "$NAME" label=0 display=active
        return
    fi
    sketchybar --set "$NAME" label="$label" display=active
}

if [ "$SENDER" = 'routine' ]; then
    main "$@"
fi
