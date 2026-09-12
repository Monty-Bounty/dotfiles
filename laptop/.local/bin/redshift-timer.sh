#!/bin/bash
# Завершаем предыдущие копии этого скрипта, чтобы избежать дубликатов при перезагрузке i3
for pid in $(pgrep -f "redshift-timer.sh"); do
    if [ "$pid" != "$$" ]; then
        kill "$pid" 2>/dev/null
    fi
done

TEMP_DAY=6500   # Дневной нейтральный свет
TEMP_NIGHT=2000 # Тёплый свет

apply_color() {
    # Получаем текущий час без ведущего нуля (0-23)
    HOUR=$(date +%-H)
    if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 19 ]; then
        redshift -P -O "$TEMP_DAY" >/dev/null 2>&1
    else
        redshift -P -O "$TEMP_NIGHT" >/dev/null 2>&1
    fi
}

while true; do
    apply_color
    sleep 60
done
