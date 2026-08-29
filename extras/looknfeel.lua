-- Optional Dos Moos look. Append to ~/.config/hypr/looknfeel.lua
-- if you want the rounded corners and window opacity this theme was tuned with.
-- Cloned themes cannot supply hyprland.lua, so these live here instead.

hl.config({
  decoration = {
    rounding = 12,
  },
})

o.window({ tag = "default-opacity" }, { opacity = "0.985 0.96" })
