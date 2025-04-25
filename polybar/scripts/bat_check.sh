if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
    if [[ -n "$BATTERY" && "$BATTERY" -ne 100 ]]; then
        echo "󰁹 $BATTERY%"
    elif [[ "$BATTERY" -eq 100 ]]; then
        echo ""
    else
        echo "Error"
    fi
else
    echo ""
fi

