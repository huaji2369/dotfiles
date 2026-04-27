if status is-interactive
    zoxide init fish --cmd=cd | source
    set -gx PAGER nvimpager
    fish_add_path ~/.local/bin/
end
