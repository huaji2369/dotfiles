#!/bin/fish

set -l cotp_password (
    fuzzel \
    --dmenu \
    --config ~/.config/fuzzel/fuzzel.ini \
    --mesg "Enter cotp password" \
    --prompt-only "Password:" \
    --password
)

if test -z "$cotp_password"
    exit 1
end

set -l cotp_output (echo "$cotp_password" | cotp --password-stdin list)

if test $status -ne 0
    notify-send -u critical "Error unlocking cotp database" "$cotp_output"
    exit 1
end

for apps in $cotp_output[2..]
    set cotp_apps $cotp_apps (echo $apps | awk '{print $1". "$2" - "$3}')
end

set -l selected_index (echo $cotp_apps\n |
    fuzzel \
    --dmenu \
    --config ~/.config/fuzzel/fuzzel.ini \
    --mesg "Select application" \
    --prompt "App:" \
    --width 40 \
    --index
)

if test -z "$selected_index"
    exit 1
end

echo "$cotp_password" | cotp --password-stdin extract --index "$selected_index" | wl-copy
notify-send "COTP" "OTP copied to clipboard"
