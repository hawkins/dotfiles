-- Personal keybinds.
-- https://github.com/JaKooLit

local HOME        = os.getenv("HOME")
local scriptsDir  = HOME .. "/.config/hypr/scripts"
local UserScripts = HOME .. "/.config/hypr/UserScripts"
local UserConfigs = HOME .. "/.config/hypr/UserConfigs"
local config_dir  = (os.getenv("XDG_CONFIG_HOME") or HOME .. "/.config") .. "/hypr"

-- Load additional app variables (term, files, Search_Engine, etc.)
dofile(config_dir .. "/custom.d/init/app-vars.lua")

-- App launcher / common apps
hl.bind("SUPER + D",      hl.dsp.exec_cmd("pkill rofi || true; rofi -show drun -modi drun,filebrowser,run,window"))
hl.bind("SUPER + B",      hl.dsp.exec_cmd('xdg-open "https://"'))
hl.bind("SUPER + Return", hl.dsp.exec_cmd(term))
hl.bind("SUPER + E",      hl.dsp.exec_cmd(files))

-- Hawkins personal binds
hl.bind("SUPER + S",          hl.dsp.window.pin())
hl.bind("SUPER + R",          hl.dsp.exec_cmd("flatpak run com.adamcake.Bolt"))
hl.bind("SUPER + SHIFT + R",  hl.dsp.exec_cmd(HOME .. "/code/float-runelite.sh 2100x1200"))

-- Features / extras
hl.bind("SUPER + H",            hl.dsp.exec_cmd(scriptsDir .. "/KeyHints.sh"))
hl.bind("SUPER + ALT + R",      hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh"))
hl.bind("SUPER + ALT + E",      hl.dsp.exec_cmd(scriptsDir .. "/RofiEmoji.sh"))
hl.bind("SUPER + ALT + O",      hl.dsp.exec_cmd(scriptsDir .. "/ChangeBlur.sh"))
hl.bind("SUPER + SHIFT + G",    hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"))
hl.bind("SUPER + ALT + L",      hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh"))
hl.bind("SUPER + ALT + V",      hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh"))
hl.bind("SUPER + CTRL + R",     hl.dsp.exec_cmd(scriptsDir .. "/RofiThemeSelector.sh"))
hl.bind("SUPER + CTRL + SHIFT + R", hl.dsp.exec_cmd("pkill rofi || true && " .. scriptsDir .. "/RofiThemeSelector-modified.sh"))

-- Window state
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + CTRL + F",  hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + SPACE",     hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"))
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(scriptsDir .. "/Dropterminal.sh " .. term))

-- Desktop zooming
hl.bind("SUPER + ALT + mouse_down", hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')"]]
))
hl.bind("SUPER + ALT + mouse_up", hl.dsp.exec_cmd(
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')"]]
))

-- Waybar / bar controls
hl.bind("SUPER + CTRL + ALT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind("SUPER + CTRL + B",       hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh"))
hl.bind("SUPER + ALT + B",        hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh"))

-- UserScripts extras
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(UserScripts .. "/RofiBeats.sh"))
hl.bind("SUPER + W",          hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh"))
hl.bind("SUPER + SHIFT + W",  hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh"))
hl.bind("CTRL + ALT + W",     hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh"))
hl.bind("SUPER + CTRL + O",   hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
hl.bind("SUPER + SHIFT + K",  hl.dsp.exec_cmd(scriptsDir .. "/KeyBinds.sh"))
hl.bind("SUPER + SHIFT + A",  hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh"))
hl.bind("SUPER + SHIFT + O",  hl.dsp.exec_cmd(UserScripts .. "/ZshChangeTheme.sh"))
hl.bind("SUPER + ALT + C",    hl.dsp.exec_cmd(UserScripts .. "/RofiCalc.sh"))
