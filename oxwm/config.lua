---@meta
---@module 'oxwm'

local modkey = "Mod4"
local altkey = "Mod1"
local terminal = "alacritty"
local launcher = "rofi -show drun"
local filemanager = "pcmanfm"

local tags = { "1","2","3","4","5","6","7","8","9" }

local colors = {
    bg = "#1a1b26",
    active_bg = "#7aa2f7",
    active_fg = "#c0caf5",
    inactive_bg = "#24283b",
    inactive_fg = "#c0caf5",
    urgent = "#f7768e"
}

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.tiled_resize_mode(true)
oxwm.set_tags(tags)
oxwm.auto_tile(true)

oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.active_bg)
oxwm.border.set_unfocused_color(colors.inactive_bg)

oxwm.gaps.set_inner(5,5)
oxwm.gaps.set_outer(5,5)

oxwm.set_layout_symbol("tiling","[T]")
oxwm.set_layout_symbol("normie","[F]")
oxwm.set_layout_symbol("tabbed","[=]")

oxwm.bar.set_font("Iosevka Nerd Font:style=Bold:size=12")

local blocks = {
    oxwm.bar.block.shell({
    format = "󰕾 {}",
    command = "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf \"%d%%\\n\", $2 * 100}'",
    interval = 1,
    color = "#c0caf5",
    underline = false,
}),
    oxwm.bar.block.static({
        text = "│",
        interval = 999999999,
        color = "#7a8ba8",
        underline = false,
    }),
    oxwm.bar.block.battery({
        format = "BAT {}%",
        charging = "󰂉 {}%",
        discharging = "󰂀 {}%",
        full = "󰁹 {}%",
        interval = 30,
        color = "#c0caf5",
        underline = false,
    }),
    oxwm.bar.block.static({
        text = "│",
        interval = 999999999,
        color = "#7a8ba8",
        underline = false,
    }),
    oxwm.bar.block.datetime({
        format = "{}",
        date_format = "󰃭 %a %b %d, 󰥔 %H:%M",
        interval = 1,
        color = "#c0caf5",
        underline = false,
    }),
}

oxwm.bar.set_blocks(blocks)

oxwm.bar.set_scheme_normal(colors.inactive_fg, colors.bg, colors.inactive_bg)
oxwm.bar.set_scheme_occupied(colors.active_fg, colors.bg, colors.active_bg)
oxwm.bar.set_scheme_selected(colors.active_fg, colors.active_bg, colors.active_bg)
oxwm.bar.set_scheme_urgent(colors.urgent, colors.bg, colors.urgent)

oxwm.key.bind({"Control",altkey},"T", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())
oxwm.key.bind({modkey},"E", oxwm.spawn({"sh","-c",filemanager}))
oxwm.key.bind({modkey},"R", oxwm.spawn({"sh","-c",launcher}))
oxwm.key.bind({},"Print", oxwm.spawn({"sh","-c","maim -s | xclip -selection clipboard -t image/png"}))
oxwm.key.bind({altkey},"F4", oxwm.client.kill())
oxwm.key.bind({modkey,"Shift"},"Q", oxwm.client.kill())
oxwm.key.bind({modkey},"F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({modkey},"T", oxwm.client.toggle_floating())
oxwm.key.bind({}, "XF86AudioRaiseVolume", oxwm.spawn({"sh", "-c", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"}))
oxwm.key.bind({}, "XF86AudioLowerVolume", oxwm.spawn({"sh", "-c", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"}))
oxwm.key.bind({}, "XF86AudioMute",        oxwm.spawn({"sh", "-c", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"}))

oxwm.key.bind({altkey},"Left", oxwm.client.focus_stack(-1))
oxwm.key.bind({altkey},"Right",oxwm.client.focus_stack(1))
oxwm.key.bind({altkey},"Up",   oxwm.client.focus_stack(-1))
oxwm.key.bind({altkey},"Down", oxwm.client.focus_stack(1))

oxwm.key.bind({modkey,"Shift"},"Left", oxwm.client.move_stack(-1))
oxwm.key.bind({modkey,"Shift"},"Right",oxwm.client.move_stack(1))
oxwm.key.bind({modkey,"Shift"},"Up",   oxwm.client.move_stack(-1))
oxwm.key.bind({modkey,"Shift"},"Down", oxwm.client.move_stack(1))
oxwm.key.bind({modkey},"Left", oxwm.set_master_factor(-30))
oxwm.key.bind({modkey},"Right", oxwm.set_master_factor(30))

oxwm.key.bind({modkey},"1", oxwm.tag.view(0))
oxwm.key.bind({modkey},"2", oxwm.tag.view(1))
oxwm.key.bind({modkey},"3", oxwm.tag.view(2))
oxwm.key.bind({modkey},"4", oxwm.tag.view(3))
oxwm.key.bind({modkey},"5", oxwm.tag.view(4))
oxwm.key.bind({modkey},"6", oxwm.tag.view(5))
oxwm.key.bind({modkey},"7", oxwm.tag.view(6))
oxwm.key.bind({modkey},"8", oxwm.tag.view(7))
oxwm.key.bind({modkey},"9", oxwm.tag.view(8))

oxwm.key.bind({modkey,"Shift"},"1", oxwm.tag.move_to(0))
oxwm.key.bind({modkey,"Shift"},"2", oxwm.tag.move_to(1))
oxwm.key.bind({modkey,"Shift"},"3", oxwm.tag.move_to(2))
oxwm.key.bind({modkey,"Shift"},"4", oxwm.tag.move_to(3))
oxwm.key.bind({modkey,"Shift"},"5", oxwm.tag.move_to(4))
oxwm.key.bind({modkey,"Shift"},"6", oxwm.tag.move_to(5))
oxwm.key.bind({modkey,"Shift"},"7", oxwm.tag.move_to(6))
oxwm.key.bind({modkey,"Shift"},"8", oxwm.tag.move_to(7))
oxwm.key.bind({modkey,"Shift"},"9", oxwm.tag.move_to(8))

oxwm.key.bind({modkey,"Shift"},"C", oxwm.restart())
oxwm.key.bind({modkey,"Shift"},"S", oxwm.restart())
oxwm.key.bind({modkey,"Shift"},"E", oxwm.quit())

oxwm.autostart("dbus-update-activation-environment --systemd DISPLAY I3SOCK XDG_CURRENT_DESKTOP=i3")
oxwm.autostart("/usr/libexec/xdg-desktop-portal-gtk")
oxwm.autostart("blueman-applet")
oxwm.autostart("nm-applet")
oxwm.autostart("dunst")
