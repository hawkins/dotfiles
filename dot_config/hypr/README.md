# Hyprland Config

This config is a hybrid of [hyprland-de (HLDE)](https://github.com/hyprland-de) and
[JaKooLit](https://github.com/JaKooLit/Hyprland-Dots) dotfiles.

`hyprland.conf` is HLDE-managed — don't edit it directly. It sources `conf.d/` for
base settings and `custom.d/` for user overrides. All personal config lives in `custom.d/`.

---

## Entry point

| File | Purpose |
|---|---|
| `hyprland.conf` | Root config. Sources everything in order. **Do not edit.** |
| `hypridle.conf` | Idle timeout / screen-lock triggers |
| `hyprlock.conf` | Lock screen layout |
| `hyprlock-1080p.conf` | Lock screen layout (1080p variant) |
| `hyprlock-de.conf` | Lock screen layout (HLDE variant) |
| `hyprlockColors.conf` | Lock screen color overrides |
| `hyprpaper.conf` | Wallpaper daemon config |
| `application-style.conf` | hyprland-qt-support style (border radius, motion) for Qt apps |
| `hyprviz.conf` | Auto-generated hyprviz config (do not edit) |

---

## conf.d/ — HLDE base config (do not edit)

HLDE writes and manages these files. They establish defaults that `custom.d/` can override.

### conf.d/init/
Sourced first, before any services launch.

| File | Purpose |
|---|---|
| `defaultApps.conf` | Default app variables (`$terminal`, `$fileManager`, `$menu`, etc.) |
| `matugen.conf` | Matugen color palette variables |

### conf.d/regular/
Sourced after init.

| File | Purpose |
|---|---|
| `autostart.conf` | Starts core HLDE services: walker, hypridle, quickshell |
| `binds.conf` | HLDE default keybinds |
| `env.conf` | Cursor theme environment variables |
| `monitors.conf` | Default monitor rule: `monitor = ,preferred,auto,auto` |
| `rules.conf` | Base window/layer rules (suppress maximize, share picker float, etc.) |
| `settings.conf` | General, decoration, animation, input, dwindle, misc settings |
| `workspaces.conf` | Base workspace rules (no gaps when maximized) |

---

## custom.d/ — User config (edit here)

Everything personal lives here. HLDE sources these files after `conf.d/`, so they
override or extend the base config.

### custom.d/init/
Sourced before HLDE's regular startup, so changes here take effect before services like
quickshell start.

| File | Purpose |
|---|---|
| `apps.conf` | App variable overrides for HLDE (`$terminal`, `$fileManager`, etc.) |
| `app-vars.conf` | JaKooLit app variables (`$term`, `$files`, `$edit`, `$Search_Engine`) sourced by keybinds |
| `autostart.conf` | Pre-HLDE startup: starts swaync before quickshell (claims notification slot), then sources `startup.conf`, loads hyprpm plugins, starts Discord |
| `settings.conf` | HLDE feature flags (e.g. disable hyprpaper, enable 12h clock in hyprlock) |

### custom.d/regular/
Sourced after HLDE's regular startup.

| File | Purpose |
|---|---|
| `binds.conf` | Unbinds all HLDE defaults, then sources the two keybind files below |
| `keybinds-base.conf` | JaKooLit default keybinds (window management, workspaces, screenshots, media) |
| `keybinds-user.conf` | Personal keybind additions (RuneLite, rofi, waybar toggles, etc.) |
| `monitors.conf` | Monitor overrides — **add your monitor config here** |
| `plugins.conf` | hyprexpo and easymotion plugin config + their keybinds |
| `rules.conf` | Window rules: tags, opacity, float, workspace assignments, layer rules |
| `settings.conf` | Input overrides (sensitivity, accel profile, repeat rate) and debug flags |
| `startup.conf` | Startup apps: swww, polkit, nm-applet, swaync, blueman, waybar, cliphist, hypridle |

### custom.d/inactive/
JaKooLit config files that are **not currently sourced by Hyprland**. They have no effect
on the running session but are preserved for reference and are accessible from the
KooL Quick Settings menu (`Super+Shift+E`).

| File | Purpose |
|---|---|
| `UserSettings.conf` | JaKooLit input, gestures, misc, dwindle/master settings (superseded by HLDE) |
| `UserDecorations.conf` | JaKooLit border, blur, shadow, opacity settings (superseded by HLDE) |
| `UserAnimations.conf` | JaKooLit animation curves — written to by the Animations script |
| `ENVariables.conf` | JaKooLit environment variables (superseded by HLDE) |
| `Laptops.conf` | Laptop-specific keybinds (ASUS keys, brightness, touchpad toggle) |

To activate any of these, add a `source = ~/.config/hypr/custom.d/inactive/<file>` line
in the appropriate `custom.d/regular/` file.

---

## scripts/ — HLDE + JaKooLit scripts (do not edit unless fixing paths)

Helper scripts called by keybinds or the KooL settings menu. Mostly JaKooLit scripts
vendored here.

## UserScripts/ — Personal scripts

User-authored scripts referenced from `custom.d/regular/keybinds-user.conf`.

## animations/ — Animation presets

Collection of preset animation configs. Select one via the KooL settings menu
(`Super+Shift+E` → Choose Hyprland Animations) — the script copies the chosen preset
into `custom.d/inactive/UserAnimations.conf`.

## Monitor_Profiles/ — Monitor layout presets

Named monitor configurations (default, fullscreen, splitscreen). Switched via
`scripts/MonitorProfiles.sh`.

## wallust/ — Wallust color theme

`wallust-hyprland.conf` is auto-generated by wallust from your wallpaper. Sourced
directly by `hyprland.conf` for border/shadow colors.

## wallpaper_effects/ — Wallpaper state

Tracks current and modified wallpaper paths. Written by `UserScripts/WallpaperEffects.sh`.

## archive/ — Dead code

Files that were never sourced by Hyprland and have no active references. Kept for
reference only.

| File | Notes |
|---|---|
| `monitors.conf` | Standalone JaKooLit monitor file, never sourced |
| `workspaces.conf` | Standalone JaKooLit workspace file, never sourced |
| `WindowRules-old.conf` | Previous window rules backup |
| `WorkSpaceRules` | JaKooLit workspace rules reference (explicitly not sourced) |
| `LaptopDisplay.conf` | Laptop lid/display helper, never sourced |
| `autostart-alt.conf` | Alternative startup strategy (kill quickshell after launch) — superseded by init approach |
| `00-Readme` | Original JaKooLit UserConfigs readme |
