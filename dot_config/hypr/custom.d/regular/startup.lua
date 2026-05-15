-- Startup applications.
-- https://github.com/JaKooLit

local HOME        = os.getenv("HOME")
local scriptsDir  = HOME .. "/.config/hypr/scripts"
local UserScripts = HOME .. "/.config/hypr/UserScripts"

hl.on("hyprland.start", function()
    -- Wallpaper daemon
    hl.exec_cmd("swww-daemon --format xrgb && swww restore")

    -- DBus / systemd environment
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Polkit authentication agent
    hl.exec_cmd(scriptsDir .. "/Polkit.sh")

    -- System tray / notification services
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("swaync")
    hl.exec_cmd("blueman-applet")

    -- Status bar and desktop overview
    hl.exec_cmd("waybar")
    hl.exec_cmd("qs")

    -- Clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Idle daemon
    hl.exec_cmd("hypridle")
end)
