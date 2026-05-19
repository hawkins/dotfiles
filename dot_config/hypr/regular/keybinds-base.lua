-- JaKooLit default keybinds.
-- https://github.com/JaKooLit

local HOME        = os.getenv("HOME")
scriptsDir        = HOME .. "/.config/hypr/scripts"
UserScripts       = HOME .. "/.config/hypr/UserScripts"
UserConfigs       = HOME .. "/.config/hypr/UserConfigs"

-- Session
hl.bind("CTRL + ALT + Delete", hl.dsp.exit())
hl.bind("SUPER + Q",           hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q",   hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"))
hl.bind("CTRL + ALT + L",      hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"))
hl.bind("CTRL + ALT + P",      hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"))
hl.bind("SUPER + SHIFT + N",   hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + SHIFT + E",   hl.dsp.exec_cmd(scriptsDir .. "/Kool_Quick_Settings.sh"))

-- Master layout
hl.bind("SUPER + CTRL + D",    hl.dsp.layout("removemaster"))
hl.bind("SUPER + I",           hl.dsp.layout("addmaster"))
hl.bind("SUPER + J",           hl.dsp.layout("cyclenext"))
hl.bind("SUPER + K",           hl.dsp.layout("cycleprev"))
hl.bind("SUPER + CTRL + Return", hl.dsp.layout("swapwithmaster"))

-- Dwindle layout
hl.bind("SUPER + SHIFT + I",   hl.dsp.layout("togglesplit"))
hl.bind("SUPER + P",           hl.dsp.window.pseudo())

-- Split ratio (works on either layout)
hl.bind("SUPER + M",           hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"))

-- Groups
hl.bind("SUPER + G",           hl.dsp.group.toggle())
hl.bind("SUPER + CTRL + tab",  hl.dsp.group.next())

-- Cycle windows (bring floating to top)
hl.bind("ALT + tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Media / hotkeys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"),        { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"),        { repeating = true, locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"),     { locked = true })
hl.bind("XF86Sleep",             hl.dsp.exec_cmd("systemctl suspend"),                     { locked = true })
hl.bind("XF86Rfkill",            hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"),        { locked = true })

hl.bind("XF86AudioPlayPause",    hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"),   { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"),   { locked = true })
hl.bind("XF86AudioStop",         hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"),  { locked = true })

-- Screenshots
hl.bind("SUPER + Print",              hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"))
hl.bind("SUPER + SHIFT + Print",      hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"))
hl.bind("SUPER + CTRL + Print",       hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"))
hl.bind("SUPER + CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"))
hl.bind("ALT + Print",                hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"))
hl.bind("SUPER + SHIFT + S",          hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy"))

-- Resize windows
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.resize({ x = -50, y = 0,  relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 50,  y = 0,  relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.resize({ x = 0,   y = -50, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }), { repeating = true })

-- Move windows
hl.bind("SUPER + CTRL + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + CTRL + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + down",  hl.dsp.window.move({ direction = "d" }))

-- Swap windows
hl.bind("SUPER + ALT + left",  hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + ALT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + ALT + up",    hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + ALT + down",  hl.dsp.window.swap({ direction = "d" }))

-- Move focus
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }))

-- Workspace cycling
hl.bind("SUPER + tab",         hl.dsp.focus({ workspace = "m+1" }))
hl.bind("SUPER + SHIFT + tab", hl.dsp.focus({ workspace = "m-1" }))

-- Special workspace
hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "special", follow = true }))
hl.bind("SUPER + U",          hl.dsp.workspace.toggle_special(""))

-- Switch workspaces with keycodes (better cross-layout support)
local codes = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
for i, code in ipairs(codes) do
    local ws = i <= 9 and i or 10
    hl.bind("SUPER + code:" .. code,              hl.dsp.focus({ workspace = ws }))
    hl.bind("SUPER + SHIFT + code:" .. code,      hl.dsp.window.move({ workspace = ws, follow = true }))
    hl.bind("SUPER + CTRL + code:" .. code,       hl.dsp.window.move({ workspace = ws }))
end

-- Bracket workspace switching
hl.bind("SUPER + SHIFT + bracketleft",  hl.dsp.window.move({ workspace = "-1", follow = true }))
hl.bind("SUPER + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind("SUPER + CTRL + bracketleft",   hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + CTRL + bracketright",  hl.dsp.window.move({ workspace = "+1" }))

-- Scroll through workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + period",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + comma",      hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
