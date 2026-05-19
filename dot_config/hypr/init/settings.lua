-- HLDE feature flags and environment settings.

-- Use 12-hour clock in hyprlock
hl.env("HLDE_HYPRLOCK_12H", "1")

-- Disable autolaunching hyprpaper (swww is used instead)
hl.env("HLDE_NO_HYPRPAPER", "1")

-- Uncomment to disable autolaunching walker's service
-- hl.env("HLDE_NO_WALKER", "1")

-- Uncomment to disable autolaunching hypridle
-- hl.env("HLDE_NO_HYPRIDLE", "1")

-- Uncomment to disable window transparency
-- hl.env("HLDE_NO_TRANSPARENT", "1")

-- Uncomment to disable removing gaps when maximized
-- hl.env("HLDE_NO_MAXIMIZED", "1")

-- Uncomment to use custom hyprlock (requires restart; config: ~/.config/hypr/hyprlock-custom.conf)
-- hl.env("HLDE_HYPRLOCK_CUSTOM", "1")

-- Uncomment to use custom hypridle (requires restart; config: ~/.config/hypr/hypridle-custom.conf)
-- hl.env("HLDE_HYPRIDLE_CUSTOM", "1")
