#!/usr/bin/env bash


main() {
    local i="$1"
    local m="$2"

    if [ "$i" = "$(aerospace list-workspaces --focused)" ]; then
        sketchybar --set "$NAME" background.drawing=on display="$m"
        return
    fi
    if [ -n "$(aerospace list-windows --workspace "$i")" ]; then
        sketchybar --set "$NAME" background.drawing=off display="$m"
        return
    fi
    sketchybar --set "$NAME" background.drawing=off display=0
}


if [ "$SENDER" = 'aerospace_workspace_change' ]; then
    main "$@"
fi
