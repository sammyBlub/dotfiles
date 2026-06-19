local var_mainMod = "SUPER"
local var_terminal = "kitty"
local var_browser = "zen"
local var_notes = "obsidian"
local var_fileManager = "nautilus"
local var_menu = "wofi"

-- MONITORS
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@120",
    position = "0x0",
    scale = 1,
})
hl.monitor({
    output = "eDP-1",
    mode = "1280x720",
    position = "1920x360",
    scale = 1,
})

-- PROGRAMS

-- AUTOSTART
hl.on("hyprland.start", function()
    hl.exec_cmd("portal")
    hl.exec_cmd("sleep 1")
    hl.exec_cmd("killall -e xdg-desktop-portal-hyprland")
    hl.exec_cmd("killall xdg-desktop-portal")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland &")
    hl.exec_cmd("sleep 2")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal &")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
    hl.exec_cmd("mako")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 1")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("waybar & nm-applet --indicator")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("hypridle")
end)

-- ENVIRONMENT
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("GTK_THEME", "adw-gtk3-dark")
hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- GENERAL
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = "rgb(6E6E6E)",
            inactive_border = "rgb(333333)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
})

-- DECORATION
hl.config({
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            new_optimizations = true,
            vibrancy = 0.1696,
            ignore_opacity = true,
        },
    },
})

-- ANIMATIONS
hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("wind", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("winIn", { type = "bezier", points = { {0.1, 1.1}, {0.1, 1.1} } })
hl.curve("winOut", { type = "bezier", points = { {0.3, -0.3}, {0, 1} } })
hl.curve("liner", { type = "bezier", points = { {1, 1}, {1, 1} } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "wind",
    style = "slide",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 6,
    bezier = "winIn",
    style = "slide",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "winOut",
    style = "slide",
})
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "wind",
    style = "slide",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 1,
    bezier = "liner",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 30,
    bezier = "liner",
    style = "loop",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "wind",
})

-- DWINDLE
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- MASTER

-- MISC
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = false,
        disable_splash_rendering = true,
        vrr = 0,
    },
})

-- INPUT
hl.config({
    input = {
        kb_layout = "fi",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- GESTURES
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- DEVICES
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- VARIABLES

-- APPLICATION BINDS
hl.bind(var_mainMod .. " + V", hl.dsp.exec_cmd("~/.config/wofi/wofi-cliphist.sh"))
hl.bind(var_mainMod .. " + R", hl.dsp.exec_cmd("wofi --show run"))
hl.bind(var_mainMod .. " + T", hl.dsp.exec_cmd(var_terminal))
hl.bind(var_mainMod .. " + B", hl.dsp.exec_cmd(var_browser))
hl.bind(var_mainMod .. " + O", hl.dsp.exec_cmd(var_notes))
hl.bind(var_mainMod .. " + F", hl.dsp.exec_cmd(var_fileManager))
hl.bind(var_mainMod .. " + A", hl.dsp.exec_cmd(var_menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd("jome -d | wl-copy"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy"))

-- WINDOW MANAGEMENT
hl.bind(var_mainMod .. " + Q", hl.dsp.window.close())
hl.bind(var_mainMod .. " + M", hl.dsp.exit())
hl.bind(var_mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(var_mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(var_mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(var_mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(var_mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(var_mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(var_mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})
hl.bind(var_mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})
hl.bind(var_mainMod .. " + Z", hl.dsp.window.drag(), {
    mouse = true,
})
hl.bind(var_mainMod .. " + X", hl.dsp.window.resize(), {
    mouse = true,
})

-- WORKSPACES
hl.bind(var_mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(var_mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(var_mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(var_mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(var_mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(var_mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(var_mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(var_mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(var_mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(var_mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(var_mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(var_mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(var_mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(var_mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(var_mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(var_mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(var_mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(var_mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(var_mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(var_mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(var_mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(var_mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(var_mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- SCREENSHOTS
hl.bind(var_mainMod .. " + S", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grimblast --notify copysave active"))
hl.bind("SUPER + ALT + Print", hl.dsp.exec_cmd("grimblast --notify copysave area"))

-- SYSTEM
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + Escape", hl.dsp.exec_cmd("killall waybar || waybar"))

-- MEDIA
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -m"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- BRIGHTNESS
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))

-- HyprMod managed settings
require("hyprland-gui")
