#!/usr/bin/env bash

i="$1"
m="$2"

main() {
    if [ "$i" = "$(aerospace list-workspaces --focused)" ]; then
        sketchybar --set space."$i" background.drawing=on display="$m"
        return
    fi
    if [ -n "$(aerospace list-windows --workspace "$i")" ]; then
        sketchybar --set space."$i" background.drawing=off display="$m"
        return
    fi
    sketchybar --set space."$i" background.drawing=off display=0
}


if [ "$SENDER" = 'aerospace_workspace_change' ]; then
    main
fi
