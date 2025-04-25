#!/usr/bin/env bash


main() {
    local i="$1"
    local m="$2"

    # Highlight the focused workspace.
    if { [ "$SENDER" = aerospace_workspace_change ] && [ "$i" = "$FOCUSED_WORKSPACE" ]; } ||
        { [ "$SENDER" = aerospace_focus_change ] && [ "$i" = "$(aerospace list-workspaces --focused)" ]; }; then
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


if [ "$SENDER" = aerospace_workspace_change ] || [ "$SENDER" = aerospace_focus_change ]; then
    main "$@"
fi
