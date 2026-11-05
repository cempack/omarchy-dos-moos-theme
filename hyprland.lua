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

-- Moor wallpaper: intro at login, then the animated loop.
--
-- Omarchy's intro player won't run before a video background, and it pauses
-- on the last frame. So when the session ends on the Moor loop, save the
-- intro clip itself as the background and leave a marker. The next session
-- starts by playing the intro as an ordinary video, and moor-handoff.sh
-- switches to the loop just before the intro's last frame, which is the
-- loop's first. Any other background is left alone, including the Moor still
-- (whose intro Omarchy plays natively).
local state_dir = (os.getenv("XDG_STATE_HOME") or (os.getenv("HOME") .. "/.local/state")) .. "/omarchy"
local theme_dir = state_dir .. "/current/theme"
local moor_intro = theme_dir .. "/backgrounds/intros/0-moor.mp4"
local moor_loop = theme_dir .. "/backgrounds/1-moor-loop.mp4"
local moor_marker = state_dir .. "/dos-moos-moor-handoff"
-- The intro is 6 s long; switching 0.15 s early covers the switch itself.
local moor_switch_at = "5.85"

local function shell_quote(text)
  return "'" .. text:gsub("'", "'\\''") .. "'"
end

local function current_background()
  local pipe = io.popen("readlink -f " .. shell_quote(state_dir .. "/current/background") .. " 2>/dev/null")
  local path = pipe and pipe:read("*l") or ""
  if pipe then
    pipe:close()
  end
  return path
end

-- Runs synchronously so it finishes before Hyprland exits.
hl.on("hyprland.shutdown", function()
  if current_background():match("/1%-moor%-loop%.mp4$") then
    os.execute("ln -nsf " .. shell_quote(moor_intro) .. " " .. shell_quote(state_dir .. "/current/background")
      .. " && touch " .. shell_quote(moor_marker))
  end
end)

hl.on("hyprland.start", function()
  if os.remove(moor_marker) then
    hl.exec_cmd("sh " .. shell_quote(theme_dir .. "/moor-handoff.sh") .. " " .. shell_quote(moor_intro)
      .. " " .. shell_quote(moor_loop) .. " " .. moor_switch_at)
  end
end)
