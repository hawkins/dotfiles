-- Hyprland configuration entry point
-- This is part of the Hyprland Desktop Experience (HLDE) + JaKooLit config.
-- DO NOT EDIT conf.d files directly. Make changes in custom.d.

local config_dir = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"

dofile(config_dir .. "/conf.d/init/defaultApps.lua")
dofile(config_dir .. "/conf.d/init/matugen.lua")
dofile(config_dir .. "/custom.d/init/apps.lua")
dofile(config_dir .. "/custom.d/init/autostart.lua")
dofile(config_dir .. "/custom.d/init/settings.lua")
dofile(config_dir .. "/conf.d/regular/autostart.lua")
dofile(config_dir .. "/conf.d/regular/binds.lua")
dofile(config_dir .. "/conf.d/regular/env.lua")
dofile(config_dir .. "/conf.d/regular/monitors.lua")
dofile(config_dir .. "/conf.d/regular/rules.lua")
dofile(config_dir .. "/conf.d/regular/settings.lua")
dofile(config_dir .. "/conf.d/regular/workspaces.lua")
dofile(config_dir .. "/custom.d/regular/binds.lua")
dofile(config_dir .. "/custom.d/regular/monitors.lua")
dofile(config_dir .. "/custom.d/regular/plugins.lua")
dofile(config_dir .. "/custom.d/regular/rules.lua")
dofile(config_dir .. "/custom.d/regular/settings.lua")
dofile(config_dir .. "/wallust/wallust-hyprland.lua")
dofile(config_dir .. "/hyprviz.lua")
