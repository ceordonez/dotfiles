#!/bin/sh
# ~/.config/sway/keys.sh
# Muestra una ventana con los atajos de Sway, leídos de tu propia config,
# así la lista siempre está al día. Escape para cerrar.

config="$HOME/.config/sway/config"

{
    printf '%-30s %s\n' "Super+1 ... 9" "go to workspace"
    printf '%-30s %s\n' "Super+Shift+1 ... 9" "move window to workspace"

    grep -E '^[[:space:]]*bindsym' "$config" \
        | grep -vE 'XF86|workspace number' \
        | sed -E 's/^[[:space:]]*bindsym[[:space:]]+(--[a-z-]+[[:space:]]+)*//; s/\$mod/Super/g' \
        | awk '{ k = $1; $1 = ""; sub(/^ /, ""); printf "%-30s %s\n", k, $0 }'
} | wofi --dmenu --insensitive --prompt "Keybindings" --width 900 --height 650 >/dev/null
