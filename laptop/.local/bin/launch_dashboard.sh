#!/usr/bin/env bash

TARGET_WS="9"

# 1. Переключаемся на нужный воркспейс
i3-msg "workspace number $TARGET_WS"

# 2. Левая колонка (верх): cmatrix
alacritty -e cmatrix  &
sleep 0.3

# 3. Делим верх левой колонки горизонтально и запускаем lf
i3-msg "split h"
alacritty -e lf &
sleep 0.3

# 4. Выделяем весь верхний блок левой колонки, делим по вертикали и запускаем htop
i3-msg "focus parent; split v"
alacritty -e htop &
sleep 0.3

# 5. Выделяем ВСЮ левую половину, делим экран горизонтально и переходим к правой колонке (tty-clock)
i3-msg "focus parent; split h"
alacritty -o "font.size=7.5" -e tty-clock -cD &
sleep 0.3

# 6. Делим правую колонку по вертикали и запускаем cava снизу
i3-msg "split v"
alacritty -e cava &
