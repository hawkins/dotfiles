-- Custom input and debug settings.

hl.config({
    input = {
        sensitivity  = 0.0,
        accel_profile = "flat",
        repeat_rate  = 50,
        repeat_delay = 300,
    },
    -- 2025-10-12: hyprEasymotion broke, temporarily suppressing errors
    debug = {
        suppress_errors = true,
    },
})
