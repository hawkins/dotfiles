-- Window and layer rules.
-- https://github.com/JaKooLit

-- Tags: browser
hl.window_rule({ match = { class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^(chrome-.+-Default)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^([Cc]hromium)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^(Brave-browser(-beta|-dev|-unstable)?)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^([Tt]horium-browser|[Cc]achy-browser)$" }, tag = "+browser" })
hl.window_rule({ match = { class = "^(zen-alpha|zen)$" }, tag = "+browser" })

-- Tags: notif
hl.window_rule({ match = { class = "^(swaync-control-center|swaync-notification-window|swaync-client|class)$" }, tag = "+notif" })

-- Tags: KooL
hl.window_rule({ match = { title = "^(KooL Quick Cheat Sheet)$" }, tag = "+KooL_Cheat" })
hl.window_rule({ match = { title = "^(KooL Hyprland Settings)$" }, tag = "+KooL_Settings" })
hl.window_rule({ match = { class = "^(nwg-displays|nwg-look)$" }, tag = "+KooL-Settings" })

-- Tags: terminal
hl.window_rule({ match = { class = "^(Alacritty|kitty|kitty-dropterm)$" }, tag = "+terminal" })

-- Tags: email
hl.window_rule({ match = { class = "^([Tt]hunderbird|org.gnome.Evolution)$" }, tag = "+email" })
hl.window_rule({ match = { class = "^(eu.betterbird.Betterbird)$" }, tag = "+email" })

-- Tags: projects
hl.window_rule({ match = { class = "^(codium|codium-url-handler|VSCodium)$" }, tag = "+projects" })
hl.window_rule({ match = { class = "^(VSCode|code-url-handler)$" }, tag = "+projects" })
hl.window_rule({ match = { class = "^(jetbrains-.+)$" }, tag = "+projects" })

-- Tags: screenshare
hl.window_rule({ match = { class = "^(com.obsproject.Studio)$" }, tag = "+screenshare" })

-- Tags: IM
hl.window_rule({ match = { class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$" }, tag = "+im_silent" })
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^([Ww]hatsapp-for-linux)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^(ZapZap|com.rtosta.zapzap)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^(teams-for-linux)$" }, tag = "+im" })
hl.window_rule({ match = { class = "^(im.riot.Riot|Element)$" }, tag = "+im" })

-- Tags: games
hl.window_rule({ match = { class = "^(gamescope)$" }, tag = "+games" })
hl.window_rule({ match = { class = "^(steam_app_%d+)$" }, tag = "+games" })
hl.window_rule({ match = { class = "^(valheim.+)$" }, tag = "+games" })
hl.window_rule({ match = { class = "^(steam_app_105600)$" }, tag = "+terraria" })

-- Tags: gamestore
hl.window_rule({ match = { title = "^([Ll]utris)$" }, tag = "+gamestore" })
hl.window_rule({ match = { title = "^(r2modman)$" }, tag = "+gamestore" })

-- Tags: file-manager
hl.window_rule({ match = { class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$" }, tag = "+file-manager" })
hl.window_rule({ match = { class = "^(app.drey.Warp)$" }, tag = "+file-manager" })

-- Tags: wallpaper
hl.window_rule({ match = { class = "^([Ww]aytrogen)$" }, tag = "+wallpaper" })

-- Tags: multimedia
hl.window_rule({ match = { class = "^([Aa]udacious)$" }, tag = "+multimedia" })

-- Tags: multimedia_video
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(Twitch).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(YouTube).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(Paramount).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(Netflix).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(HBO).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { xwayland = false, fullscreen = false, title = "^.*(Hulu).*$" }, tag = "+multimedia_video" })
hl.window_rule({ match = { class = "^([Mm]pv|vlc)$" }, tag = "+multimedia_video" })

-- Multimedia overrides
hl.window_rule({ match = { tag = "multimedia_video" }, tag = "-browser" })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, tag = "-browser" })
hl.window_rule({ match = { title = "^(Picture in picture)$" }, tag = "-browser" })
hl.window_rule({ match = { tag = "multimedia_video" }, opaque = true, no_dim = true })

-- Tags: settings
hl.window_rule({ match = { title = "^(ROG Control)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(wihotspot(-gui)?)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^([Bb]aobab|org.gnome.[Bb]aobab)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(gnome-disks|wihotspot(-gui)?)$" }, tag = "+settings" })
hl.window_rule({ match = { title = "(Kvantum Manager)" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(file-roller|org.gnome.FileRoller)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(nm-applet|nm-connection-editor|blueman-manager)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(qt5ct|qt6ct|[Yy]ad)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "(xdg-desktop-portal-gtk)" }, tag = "+settings" })
hl.window_rule({ match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" }, tag = "+settings" })
hl.window_rule({ match = { class = "^([Rr]ofi)$" }, tag = "+settings" })

-- Tags: viewer
hl.window_rule({ match = { class = "^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(evince)$" }, tag = "+viewer" })
hl.window_rule({ match = { class = "^(eog|org.gnome.Loupe)$" }, tag = "+viewer" })

-- Position rules
hl.window_rule({ match = { tag = "KooL_Cheat" },  center = true })
hl.window_rule({ match = { class = "([Tt]hunar)", title = "negative:(.*[Tt]hunar.*)" }, center = true })
hl.window_rule({ match = { title = "^(ROG Control)$" }, center = true })
hl.window_rule({ match = { tag = "KooL-Settings" }, center = true })
hl.window_rule({ match = { title = "^(Keybindings)$" }, center = true })
hl.window_rule({ match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" }, center = true })
hl.window_rule({ match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" }, center = true })
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, center = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, move = { "monitor_w * 0.72", "monitor_h * 0.07" } })

-- Workspace assignments
hl.window_rule({ match = { tag = "games" },     workspace = "2" })
hl.window_rule({ match = { tag = "im" },        workspace = "3" })
hl.window_rule({ match = { tag = "im_silent" }, workspace = "3 silent" })
hl.window_rule({ match = { tag = "gamestore" }, workspace = "4" })
hl.window_rule({ match = { class = "^([Ss]team)$" }, workspace = "4 silent" })
hl.window_rule({ match = { tag = "screenshare" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(virt-manager)$" }, workspace = "6 silent" })
hl.window_rule({ match = { class = "^(.virt-manager-wrapped)$" }, workspace = "6 silent" })
hl.window_rule({ match = { tag = "multimedia" }, workspace = "9 silent" })

-- Float rules
hl.window_rule({ match = { class = "^(com.adamcake.Bolt)$" }, float = true })
hl.window_rule({ match = { title = "^(RuneLite Launcher)$" }, float = true })
hl.window_rule({ match = { tag = "KooL_Cheat" }, float = true })
hl.window_rule({ match = { tag = "wallpaper" }, float = true })
hl.window_rule({ match = { tag = "settings" }, float = true })
hl.window_rule({ match = { tag = "viewer" }, float = true })
hl.window_rule({ match = { tag = "KooL-Settings" }, float = true })
hl.window_rule({ match = { class = "([Zz]oom|onedriver|onedriver-launcher)$" }, float = true })
hl.window_rule({ match = { class = "(org.gnome.Calculator)", title = "(Calculator)" }, float = true })
hl.window_rule({ match = { class = "^(mpv|com.github.rafostar.Clapper)$" }, float = true })
hl.window_rule({ match = { class = "^([Qq]alculate-gtk)$" }, float = true })
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, float = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, float = true })

-- Float: popups and dialogs
hl.window_rule({ match = { title = "^(Authentication Required)$" }, float = true, center = true })
hl.window_rule({ match = { class = "(codium|codium-url-handler|VSCodium)", title = "negative:(.*codium.*|.*VSCodium.*)" }, float = true })
hl.window_rule({ match = { class = "^([Ss]team)$", title = "negative:^([Ss]team)$" }, float = true })
hl.window_rule({ match = { class = "([Tt]hunar)", title = "negative:(.*[Tt]hunar.*)" }, float = true })

hl.window_rule({ match = { title = "^(Add Folder to Workspace)$" }, float = true, size = { "monitor_w * 0.70", "monitor_h * 0.60" }, center = true })
hl.window_rule({ match = { title = "^(Save As)$" }, float = true, size = { "monitor_w * 0.70", "monitor_h * 0.60" }, center = true })
hl.window_rule({ match = { initial_title = "(Open Files)" }, float = true, size = { "monitor_w * 0.70", "monitor_h * 0.60" } })

hl.window_rule({ match = { title = "^(SDDM Background)$" }, float = true, center = true, size = { "monitor_w * 0.16", "monitor_h * 0.12" } })

-- Opacity rules
hl.window_rule({ match = { tag = "browser" },      opacity = "0.9 0.7" })
hl.window_rule({ match = { tag = "projects" },     opacity = "0.9 0.8" })
hl.window_rule({ match = { tag = "im" },           opacity = "0.94 0.86" })
hl.window_rule({ match = { tag = "file-manager" }, opacity = "0.9 0.8" })
hl.window_rule({ match = { tag = "terminal" },     opacity = "0.8 0.7" })
hl.window_rule({ match = { tag = "settings" },     opacity = "0.8 0.7" })
hl.window_rule({ match = { tag = "viewer" },       opacity = "0.82 0.75" })
hl.window_rule({ match = { tag = "wallpaper" },    opacity = "0.9 0.7" })
hl.window_rule({ match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" }, opacity = "0.8 0.7" })
hl.window_rule({ match = { class = "^(deluge)$" }, opacity = "0.9 0.8" })
hl.window_rule({ match = { class = "^(seahorse)$" }, opacity = "0.9 0.8" })
-- Video content and PiP always opaque
hl.window_rule({ match = { tag = "multimedia_video" }, opaque = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, opaque = true })

-- Size rules
hl.window_rule({ match = { tag = "KooL_Cheat" },  size = { "monitor_w * 0.65", "monitor_h * 0.90" } })
hl.window_rule({ match = { tag = "wallpaper" },    size = { "monitor_w * 0.70", "monitor_h * 0.70" } })
hl.window_rule({ match = { tag = "settings" },     size = { "monitor_w * 0.70", "monitor_h * 0.70" } })
hl.window_rule({ match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" }, size = { "monitor_w * 0.60", "monitor_h * 0.70" } })
hl.window_rule({ match = { class = "^([Ff]erdium)$" }, size = { "monitor_w * 0.60", "monitor_h * 0.70" } })

-- Pinning
hl.window_rule({ match = { title = "^(Picture in picture)$" }, float = true, pin = true })
hl.window_rule({ match = { title = "^(Picture-in-Picture)$" }, pin = true, keep_aspect_ratio = true })

-- Games
hl.window_rule({ match = { tag = "games" }, no_blur = true, fullscreen = true, opaque = true })
hl.window_rule({ match = { class = "^.*RuneLite.*$" }, opaque = true })

-- Terraria: override fullscreen, cap width
hl.window_rule({ match = { tag = "terraria" }, fullscreen = false, size = { 4096, 1702 } })

-- RuneLite tooltips: no decorations, no focus steal
hl.window_rule({
    match = { class = "^(net-runelite-client-RuneLite)$", title = "^(win[0-9]+)$", float = true },
    no_focus  = true,
    border_size = 0,
    no_shadow = true,
    no_anim   = true,
})

-- Layer rules
hl.layer_rule({ match = { namespace = "rofi" },               blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "notifications" },       blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "quickshell:overview" }, blur = true, ignore_alpha = 0.5 })
