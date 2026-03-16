---@meta
---@module 'oxwm'

-----------------------------
-- Variables
-----------------------------
local modkey = "Mod4"
local altkey = "Mod1"
local terminal = "alacritty"
local launcher = "rofi -show drun"
local filemanager = "pcmanfm"

local tags = { "1","2","3","4","5","6","7","8","9","10" }

local colors = {
    bg = "#1a1b26",
    active_bg = "#7aa2f7",
    active_fg = "#1a1b26",
    inactive_bg = "#24283b",
    inactive_fg = "#c0caf5",
    urgent = "#f7768e"
}

-----------------------------
-- Basic Settings
-----------------------------
oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey)
oxwm.set_tags(tags)

-----------------------------
-- Appearance
-----------------------------
oxwm.border.set_width(2)
oxwm.border.set_focused_color(colors.active_bg)
oxwm.border.set_unfocused_color(colors.inactive_bg)

oxwm.gaps.set_inner(5,5)
oxwm.gaps.set_outer(5,5)

-----------------------------
-- Layout symbols
-----------------------------
oxwm.set_layout_symbol("tiling","[T]")
oxwm.set_layout_symbol("normie","[F]")
oxwm.set_layout_symbol("tabbed","[=]")

-----------------------------
-- Keybindings
-----------------------------

-- Terminal (Ctrl+Alt+T)
oxwm.key.bind({"Control",altkey},"T",
    oxwm.spawn_terminal()
)

-- File manager (Mod+E)
oxwm.key.bind({modkey},"E",
    oxwm.spawn({"sh","-c",filemanager})
)

-- Launcher (Mod+R)
oxwm.key.bind({modkey},"R",
    oxwm.spawn({"sh","-c",launcher})
)

-- Screenshot
oxwm.key.bind({},"Print",
    oxwm.spawn({"sh","-c","maim -s | xclip -selection clipboard -t image/png"})
)

-- Kill window (Alt+F4)
oxwm.key.bind({altkey},"F4",
    oxwm.client.kill()
)

-- Kill (Mod+Shift+Q)
oxwm.key.bind({modkey,"Shift"},"Q",
    oxwm.client.kill()
)

-- Fullscreen (Mod+F)
oxwm.key.bind({modkey},"F",
    oxwm.client.toggle_fullscreen()
)

-- Floating toggle (Mod+T)
oxwm.key.bind({modkey},"T",
    oxwm.client.toggle_floating()
)

-----------------------------
-- Focus movement (Arrow keys)
-----------------------------
oxwm.key.bind({modkey},"Left", oxwm.client.focus_stack(-1))
oxwm.key.bind({modkey},"Right",oxwm.client.focus_stack(1))
oxwm.key.bind({modkey},"Up",   oxwm.client.focus_stack(-1))
oxwm.key.bind({modkey},"Down", oxwm.client.focus_stack(1))

-----------------------------
-- Move windows
-----------------------------
oxwm.key.bind({modkey,"Shift"},"Left", oxwm.client.move_stack(-1))
oxwm.key.bind({modkey,"Shift"},"Right",oxwm.client.move_stack(1))
oxwm.key.bind({modkey,"Shift"},"Up",   oxwm.client.move_stack(-1))
oxwm.key.bind({modkey,"Shift"},"Down", oxwm.client.move_stack(1))

-----------------------------
-- Workspace navigation
-----------------------------
oxwm.key.bind({modkey},"1", oxwm.tag.view(0))
oxwm.key.bind({modkey},"2", oxwm.tag.view(1))
oxwm.key.bind({modkey},"3", oxwm.tag.view(2))
oxwm.key.bind({modkey},"4", oxwm.tag.view(3))
oxwm.key.bind({modkey},"5", oxwm.tag.view(4))
oxwm.key.bind({modkey},"6", oxwm.tag.view(5))
oxwm.key.bind({modkey},"7", oxwm.tag.view(6))
oxwm.key.bind({modkey},"8", oxwm.tag.view(7))
oxwm.key.bind({modkey},"9", oxwm.tag.view(8))
oxwm.key.bind({modkey},"0", oxwm.tag.view(9))

-- Move window to workspace
oxwm.key.bind({modkey,"Shift"},"1", oxwm.tag.move_to(0))
oxwm.key.bind({modkey,"Shift"},"2", oxwm.tag.move_to(1))
oxwm.key.bind({modkey,"Shift"},"3", oxwm.tag.move_to(2))
oxwm.key.bind({modkey,"Shift"},"4", oxwm.tag.move_to(3))
oxwm.key.bind({modkey,"Shift"},"5", oxwm.tag.move_to(4))
oxwm.key.bind({modkey,"Shift"},"6", oxwm.tag.move_to(5))
oxwm.key.bind({modkey,"Shift"},"7", oxwm.tag.move_to(6))
oxwm.key.bind({modkey,"Shift"},"8", oxwm.tag.move_to(7))
oxwm.key.bind({modkey,"Shift"},"9", oxwm.tag.move_to(8))
oxwm.key.bind({modkey,"Shift"},"0", oxwm.tag.move_to(9))

-----------------------------
-- Restart / Exit
-----------------------------
oxwm.key.bind({modkey,"Shift"},"C", oxwm.restart())
oxwm.key.bind({modkey,"Shift"},"S", oxwm.restart())
oxwm.key.bind({modkey,"Shift"},"E", oxwm.quit())

-----------------------------
-- Autostart
-----------------------------
oxwm.autostart("dbus-update-activation-environment --systemd DISPLAY I3SOCK XDG_CURRENT_DESKTOP=i3")
oxwm.autostart("/usr/libexec/xdg-desktop-portal-gtk")
oxwm.autostart("blueman-applet")
oxwm.autostart("nm-applet")
oxwm.autostart("dunst")
