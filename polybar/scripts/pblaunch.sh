#!/bin/bash

#!/bin/bash
# Terminate already running Polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
case $(hostname) in 
    fedora)
        MONITOR="DP-1-3" polybar example &
        ;;
    *)
        polybar example &
        ;;
esac 

