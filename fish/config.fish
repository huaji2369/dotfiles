if status is-interactive
	zoxide init fish --cmd=cd | source
	set -gx PAGER nvimpager
end
