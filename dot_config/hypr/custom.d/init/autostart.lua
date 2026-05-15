-- Custom autostart: swaync runs first so HLDE quickshell uses it for notifications.

hl.on("hyprland.start", function()
    hl.exec_cmd("swaync")
end)

-- startup.lua registers its own hyprland.start handler for the rest of the apps
local config_dir = (os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config") .. "/hypr"
dofile(config_dir .. "/custom.d/regular/startup.lua")

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/dynamic-opacity.sh")
    hl.exec_cmd("discord")
    hl.exec_cmd("steam")
end)
