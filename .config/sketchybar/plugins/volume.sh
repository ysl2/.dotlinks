#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

main() {
  sketchybar --set "$NAME" icon="Vol:" label="$INFO% ($(SwitchAudioSource -c))"
}

if [ "$SENDER" = volume_change ]; then
    main "$@"
fi
