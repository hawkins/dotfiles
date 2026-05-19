-- Hyprland plugin configuration.

hl.config({
    plugin = {
        hyprexpo = {
            columns          = 3,
            gap_size         = 5,
            bg_col           = "rgb(111111)",
            workspace_method = "first 1",
            enable_gesture   = true,
            gesture_fingers  = 3,
            gesture_distance = 300,
            gesture_positive = true,
        },

        easymotion = {
            textsize         = 60,
            textfont         = "Operator Mono",
            bgcolor          = 0,
            fullscreen_action = "none",
            motionkeys       = "abcdefghijklmnopqrstuvwxyz1234567890",
            motionlabels     = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            only_special     = true,
        },
    },
})

-- Plugin dispatchers via hyprctl (no Lua API for plugin dispatchers yet)
hl.bind("SUPER + A", hl.dsp.exec_cmd("hyprctl dispatch hyprexpo:expo toggle"))
hl.bind("SUPER + z", hl.dsp.exec_cmd("hyprctl dispatch easymotion action:hyprctl dispatch focuswindow address:{}"))
