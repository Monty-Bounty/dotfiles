#!/bin/sh

# Экспорт переменных под GTK и порталы
export XDG_CURRENT_DESKTOP=i3
export XDG_SESSION_DESKTOP=i3
export QT_QPA_PLATFORMTHEME=gtk3

# Запуск Secret Service (хранилище ключей Anytype)
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Передача переменных в шину D-Bus
dbus-update-activation-environment --all

# Запуск i3
exec i3
