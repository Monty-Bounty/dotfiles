#!/usr/bin/env bash
killall -o 1s -q $(basename "$0") 2>/dev/null || true
# Автоматический поиск батареи в системе
BAT=$(find /sys/class/power_supply/ -name "BAT*" 2>/dev/null | head -n 1)

if [ -z "$BAT" ]; then
    exit 1
fi

STATE_FILE="/tmp/battery_alert_state"

while true; do
    CAPACITY=$(cat "$BAT/capacity")
    STATUS=$(cat "$BAT/status")

    LAST_STATE=""
    [ -f "$STATE_FILE" ] && LAST_STATE=$(cat "$STATE_FILE")

    # Уведомление при разряде до 40% и ниже
    if [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -le 40 ]; then
        if [ "$LAST_STATE" != "discharging_40" ]; then
            notify-send -u critical -i battery-caution \
                "Батарея разряжена" \
                "Текущий уровень заряда: ${CAPACITY}%."
            echo "discharging_40" > "$STATE_FILE"
        fi

    # Уведомление при зарядке до 80% и выше
    elif [ "$STATUS" = "Charging" ] && [ "$CAPACITY" -ge 80 ]; then
        if [ "$LAST_STATE" != "charging_80" ]; then
            notify-send -u normal -i battery-charging \
                "Зарядка завершена" \
                "Уровень заряда достиг ${CAPACITY}%."
            echo "charging_80" > "$STATE_FILE"
        fi

    # Сброс флагов при смене режима питания
    elif [ "$STATUS" = "Charging" ] && [ "$LAST_STATE" = "discharging_40" ]; then
        rm -f "$STATE_FILE"
    elif [ "$STATUS" = "Discharging" ] && [ "$LAST_STATE" = "charging_80" ]; then
        rm -f "$STATE_FILE"
    fi

    sleep 60
done
