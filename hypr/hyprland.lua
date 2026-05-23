-- ──────────────────────────────────────────────────────────────────
-- MONITORS
-- ──────────────────────────────────────────────────────────────────
-- hl.monitor({ output = "DP-2", mode = "1920x1080@180", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@144", position = "0x200", scale = 1.2 })
hl.monitor({ output = "HDMI-A-1", mode = "1280x1024@75", position = "-1280x0", scale = 1 })
hl.monitor({ output = "WAYLAND-1", disabled = true })

-- ──────────────────────────────────────────────────────────────────
-- AUTOSTART
-- ──────────────────────────────────────────────────────────────────
hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("gentoo-pipewire-launcher")
    hl.exec_cmd("hyprctl setcursor Notwaita-Black 24")
end)

-- ──────────────────────────────────────────────────────────────────
-- ENVIRONMENT VARIABLES
-- ──────────────────────────────────────────────────────────────────
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "default")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- ──────────────────────────────────────────────────────────────────
-- CUSTOMIZATION
-- ──────────────────────────────────────────────────────────────────
hl.config({
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1.0,
        shadow = { enabled = false },
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            new_optimizations = true,
            xray = false,
        },
    },
})

-- ──────────────────────────────────────────────────────────────────
-- INPUT
-- ──────────────────────────────────────────────────────────────────
hl.config({
    input = {
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        repeat_delay = 360,
        repeat_rate = 25,
        touchpad = { natural_scroll = true },
    },
})

-- ──────────────────────────────────────────────────────────────────
-- GENERAL
-- ──────────────────────────────────────────────────────────────────
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = "rgba(7aa2f7ff)",
            inactive_border = "rgba(24283bff)",
        },
        resize_on_border = true,
        layout = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
        animate_manual_resizes = true,
    },
})
hl.config({
    dwindle = {
        force_split = 0,
    }
})

-- ──────────────────────────────────────────────────────────────────
-- ANIMATIONS
-- ──────────────────────────────────────────────────────────────────
hl.curve("easeOut", { type = "bezier", points = { {0.0, 0.9}, {0.57, 1.0} } })
hl.curve("easeIn",  { type = "bezier", points = { {0.4, 0.0}, {1.0, 0.6} } })
hl.curve("snap",    { type = "bezier", points = { {0.1, 0.9}, {0.2, 1.0} } })

hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4, bezier = "easeOut", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4, bezier = "easeIn",  style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "snap" })
hl.animation({ leaf = "border",      enabled = true, speed = 3, bezier = "easeOut" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3, bezier = "easeOut", style = "slidevert" })
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 2, bezier = "easeOut" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 2, bezier = "easeIn" })
hl.animation({ leaf = "fadeLayers",  enabled = true, speed = 2, bezier = "easeOut" })

-- ──────────────────────────────────────────────────────────────────
-- KEYBINDS
-- ──────────────────────────────────────────────────────────────────
local mod = "SUPER"

-- Apps
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("pcmanfm"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Sound
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

-- Session
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprctl reload"))

-- ──────────────────────────────────────────────────────────────────
-- WINDOW MANAGEMENT
-- ──────────────────────────────────────────────────────────────────
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }))

for i = 1, 10 do
    local key = i % 10 
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
