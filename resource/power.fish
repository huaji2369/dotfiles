#!/usr/bin/env fish

set -l power_operation (printf "poweroff\nreboot\nsuspend\nhibernate" |\
    fuzzel \
    --dmenu \
    --mesg "Select power operation" \
    --hide-prompt \
    --lines 4)

if test -z "$power_operation"
    exit 1
end
switch $power_operation
    case "poweroff"
        systemctl poweroff
    case "reboot"
        systemctl reboot
    case "suspend"
        systemctl suspend
    case "hibernate"
        systemctl hibernate
end