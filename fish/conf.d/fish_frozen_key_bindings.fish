# This file was created by fish to migrate the 'fish_key_bindings' variable
# from its old default scope (universal) to its new default scope (global).
# It is recommended you delete this file and configure key bindings however
# you prefer.

set --global fish_key_bindings fish_vi_key_bindings

# Prior to version 4.3, fish shipped an event handler that runs
# `set --universal fish_key_bindings fish_default_key_bindings`
# whenever the fish_key_bindings variable is erased.
# This means that as long as any fish < 4.3 is still running on this system,
# we cannot complete the migration.
# As a workaround, we erase the universal variable at every shell startup.
set --erase --universal fish_key_bindings
