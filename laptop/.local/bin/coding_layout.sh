#!/usr/bin/env bash

# a coding layout using 3 windows
# just write "code {path/to/file/or/directory}"
# and magic will happen on workspase 3

TARGET_WS="3"

if [ -z "$1" ]; then
    TARGET_DIR="$PWD"
    TARGET_FILE=""
elif [ -d "$1" ]; then
    TARGET_DIR=$(realpath "$1")
    TARGET_FILE=""
elif [ -f "$1" ]; then
    FULL_PATH=$(realpath "$1")
    TARGET_DIR=$(dirname "$FULL_PATH")
    TARGET_FILE="$FULL_PATH"
elif [ -d "$(dirname "$1")" ]; then
    FULL_PATH="$(realpath -m "$1")"
    TARGET_DIR="$(dirname "$FULL_PATH")"
    TARGET_FILE="$FULL_PATH"
else
    echo "Ошибка: путь '$1' не существует." >&2
    exit 1
fi

# 1. Переключаемся на нужный воркспейс
i3-msg "workspace number $TARGET_WS"

# 2. Левая стророна - code editor 
# Конструкция ${TARGET_FILE:+ ...} подставит аргумент в кавычках только если переменная не пустая. Если она пустая — строка свернется в чистый micro.
i3-msg "exec alacritty --working-directory \"$TARGET_DIR\" -e micro ${TARGET_FILE:+ \"$TARGET_FILE\"}"
sleep 0.3

# 3. general purpose terminal 
i3-msg "exec alacritty --working-directory \"$TARGET_DIR\""
sleep 0.3
i3-msg "resize shrink width 5 px or 5 ppt"
sleep 0.3

# 4. files
i3-msg "split v"
i3-msg "exec alacritty --working-directory \"$TARGET_DIR\" -e lf"
sleep 0.3
i3-msg "resize shrink height 10 px or 10 ppt"
sleep 0.3
i3-msg "focus left"
