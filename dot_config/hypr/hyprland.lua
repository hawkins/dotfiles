-- Hyprland configuration entry point

local config_dir = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"

dofile(config_dir .. "/init/matugen.lua")
dofile(config_dir .. "/init/autostart.lua")
dofile(config_dir .. "/init/settings.lua")
dofile(config_dir .. "/regular/autostart.lua")
dofile(config_dir .. "/regular/env.lua")
dofile(config_dir .. "/regular/monitors.lua")
dofile(config_dir .. "/regular/rules.lua")
dofile(config_dir .. "/regular/settings.lua")
dofile(config_dir .. "/regular/workspaces.lua")
dofile(config_dir .. "/regular/binds.lua")
dofile(config_dir .. "/regular/plugins.lua")
dofile(config_dir .. "/wallust/wallust-hyprland.lua")
dofile(config_dir .. "/hyprviz.lua")
