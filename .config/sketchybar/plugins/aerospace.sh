#!/usr/bin/env bash


main() {
    local i="$1"
    local m="$2"

    # if [ "$i" = "$(aerospace list-workspaces --focused)" ]; then
    # Highlight the focused workspace.
    if [ "$i" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set "$NAME" background.drawing=on display="$m" &
    else
        sketchybar --set "$NAME" background.drawing=off &
        # If workspace has window, show it.
        if [ -n "$(aerospace list-windows --workspace "$i")" ]; then
            sketchybar --set "$NAME" display="$m" &
        else
            # Else, hide it.
            sketchybar --set "$NAME" display=0 &
        fi
    fi
}


if [ "$SENDER" = aerospace_workspace_change ]; then
    main "$@"
fi
