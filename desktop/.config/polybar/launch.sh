#!/usr/bin/env bash
killall -q polybar
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# polybar example & # "example" — это название стандартного бара в конфиге
# # [bar/example]
# # bottom = true

# Подождать завершения и дать фоновым службам Mint инициализироваться
sleep 1.5

# Применить раскладку ПЕРЕД запуском бара
setxkbmap -model pc105 -layout us,ru -option '' -option grp:alt_shift_toggle

# Запустить бар
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
