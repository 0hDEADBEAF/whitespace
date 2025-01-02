#! /bin/sh
suspend="systemctl suspend && swaylock -i ~/Images/lock.jpg"

# special method for loggin out :(
logout="killall Hyprland"

chosen=$(printf "Log Out\nSuspend\nRestart\nPower OFF" | rofi -dmenu -i -theme-str '@import "~/.config/rofi/powermenu.rasi"')

# Perform the action based on user choice
case "$chosen" in
    "Log Out") $logout ;;
    "Suspend") eval $suspend ;;
    "Restart") systemctl reboot ;;
    "Power OFF") systemctl poweroff ;;
    *) exit 1 ;;
esac
