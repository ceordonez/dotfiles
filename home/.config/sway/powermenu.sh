#!/bin/sh
choice=$(printf 'Shutdown\nReboot\nSuspend\nLock\nLogout' | wofi --dmenu --prompt "System")
case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot)   systemctl reboot ;;
  Suspend)  systemctl suspend ;;
    Lock)     swaylock -f ;;
  Logout)   swaymsg exit ;;
esac
