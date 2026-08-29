-- Dos Moos Hyprland — same pattern as stock Solitude:
-- rounding lives on the theme, not in ~/.config/hypr/looknfeel.lua.

local active_border_color = "rgb(A5B5AB)"
local inactive_border_color = "rgb(35373A)"

hl.config({
  general = {
    border_size = 1,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },
  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },
  decoration = {
    rounding = 12,
    rounding_power = 2,
    active_opacity = 0.985,
    inactive_opacity = 0.96,
    fullscreen_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 15,
      render_power = 3,
      color = "rgba(0A0B06ee)",
      color_inactive = "rgba(0A0B0688)",
    },
    blur = {
      enabled = false,
    },
  },
})

hl.window_rule({
  opacity = "1.0 override 1.0 override",
  match = {
    class = "^(imv|mpv|vlc|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|zoom|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta)$",
  },
})

hl.window_rule({
  opacity = "1.0 override 1.0 override",
  match = {
    class = "^(gimp|com.github.xournalpp.xournalpp|nwg-look|system-config-printer)$",
  },
})
