#!/usr/bin/env bash


main() {
    # if defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep Bundle | grep -qv PressAndHold; then
    # if defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -q sogou; then
    if defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -q 'InputSourceKind = "Input Mode"'; then
        sketchybar --set "$NAME" label=拼音
        return
    fi
    sketchybar --set "$NAME" label=ABC
}


if [ "$SENDER" = 'routine' ]; then
    main "$@"
fi
