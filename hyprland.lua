-- Dos Moos Hyprland — same pattern as stock Solitude:
-- rounding lives on the theme, not in ~/.config/hypr/looknfeel.lua.
--
-- Window opacity is left to Omarchy: since 4.5 it makes terminals and a few
-- apps see-through at 0.985 / 0.96 and keeps everything else solid, and
-- Appearance > Windows > Window Opacity switches them to opaque or glassy.

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
    shadow = {
      enabled = true,
      range = 15,
      render_power = 3,
      color = "rgba(0A0B06ee)",
      color_inactive = "rgba(0A0B0688)",
    },
    -- Off unless a Glassy toggle turns it on; those load after the theme.
    blur = {
      enabled = false,
    },
  },
})
