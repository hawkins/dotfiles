-- Remove all HLDE default binds and replace with JaKooLit + user binds.

local config_dir = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"

hl.unbind("all")

dofile(config_dir .. "/custom.d/regular/keybinds-base.lua")
dofile(config_dir .. "/custom.d/regular/keybinds-user.lua")
