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

#set -l cotp_apps

for apps in $cotp_output[2..]
    set -l apps (string trim -- "$apps")
    if test -n "$apps"
        set cotp_apps $cotp_apps (echo $apps | awk '{print $1". "$2" - "$3}')
    end
end

if test (count $cotp_apps) -eq 0
    notify-send -u critical "COTP" "No applications found in database"
    exit 1
end

set -l selected_index (printf '%s\n' $cotp_apps |
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

echo "$cotp_password" |\
cotp --password-stdin extract --index "$selected_index" |\
tr -d '\n' |\
wl-copy

notify-send "COTP" "OTP copied to clipboard"
