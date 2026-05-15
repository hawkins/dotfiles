-- credit https://github.com/JaKooLit
-- Laptop-specific keybinds and device config

local mainMod    = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"
local UserConfigs = os.getenv("HOME") .. "/.config/hypr/UserConfigs"

local TOUCHPAD_DEVICE = "asue1209:00-04f3:319f-touchpad"

-- Keyboard brightness
hl.bind(", xf86KbdBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "/BrightnessKbd.sh --dec"), { repeating = true })
hl.bind(", xf86KbdBrightnessUp",   hl.dsp.exec_cmd(scriptsDir .. "/BrightnessKbd.sh --inc"), { repeating = true })

-- ASUS-specific buttons
hl.bind(", xf86Launch1", hl.dsp.exec_cmd("rog-control-center"))
hl.bind(", xf86Launch3", hl.dsp.exec_cmd("asusctl led-mode -n"))
hl.bind(", xf86Launch4", hl.dsp.exec_cmd("asusctl profile -n"))

-- Monitor brightness
hl.bind(", xf86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --dec"), { repeating = true })
hl.bind(", xf86MonBrightnessUp",   hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --inc"), { repeating = true })

-- Touchpad toggle
hl.bind(", xf86TouchpadToggle", hl.dsp.exec_cmd(scriptsDir .. "/TouchPad.sh"))

-- Screenshot via F6
hl.bind(mainMod .. " + F6",             hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"))
hl.bind(mainMod .. " + SHIFT + F6",     hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"))
hl.bind(mainMod .. " + CTRL + F6",      hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"))
hl.bind(mainMod .. " + ALT + F6",       hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"))
hl.bind("ALT + F6",                     hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"))

-- Touchpad device config
hl.config({
    device = {
        name    = TOUCHPAD_DEVICE,
        enabled = true,
    },
})

-- Lid switch binds (uncomment as needed):
-- hl.bind(", switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, preferred, auto, 1"'), { locked = true })
-- hl.bind(", switch:on:Lid Switch",  hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable"'),           { locked = true })
