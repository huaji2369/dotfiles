if status is-interactive
end
set -gx fish_complete_path /home/huaji2369/.config/fish/completions /etc/fish/completions /home/huaji2369/.local/share/fish/vendor_completions.d /home/huaji2369/.cache/fish/generated_completions /usr/share/fish/vendor_completions.d/
set -gx fish_function_path /home/huaji2369/.config/fish/functions /etc/fish/functions /home/huaji2369/.local/share/fish/vendor_functions.d /usr/share/fish/vendor_functions.d/
zoxide init --cmd cd fish | source
