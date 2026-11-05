<p align="center">
  <img src="./preview.png" alt="Dos Moos on Omarchy" width="720" />
</p>

<h1 align="center">Dos Moos</h1>

<p align="center">
  <em>A muted sage theme for <a href="https://omarchy.org/">Omarchy</a> 4 — moss hills, linen text, near-black chrome</em>
</p>

<p align="center">
  <img alt="For Omarchy" src="https://img.shields.io/badge/for-Omarchy%204-819890?style=for-the-badge" />
  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-A5B5AB?style=for-the-badge" />
</p>

Dark forest greens, ash-gray borders, and warm linen on `#131516`. The default wallpaper is **Moor**, an animated paper-cut moorland: the hills fold up out of the dark at login, then the mist keeps drifting.

Based on [HANCORE's Dos-Moos](https://github.com/HANCORE-linux/omarchy-dos-moos-theme), with the animated Moor wallpaper, a custom Plymouth unlock screen, sage menu selection, and rounded windows. Window translucency follows Omarchy 4.5 (Appearance → Windows → Window Opacity).

## Install

```bash
omarchy theme install https://github.com/cempack/omarchy-dos-moos-theme.git
rm -rf ~/.config/omarchy/themes/dos-moos/.git
omarchy theme set dos-moos
```

Or from the Omarchy menu: **Super + Alt + Space** → **Install → Style → Theme**, paste the URL, press Enter. Then drop the leftover `.git` and re-apply, as above.

Omarchy ignores `hyprland.lua` on a cloned repo (it regenerates one from `colors.toml`). Removing `.git` makes this a user theme, so its rounding and borders load the same way stock **Solitude** does.

To use it again later:

```bash
omarchy theme set dos-moos
```

### Unlock screen (Plymouth)

After install, pick **dos-moos** in the unlock switcher, or:

```bash
omarchy plymouth set by theme dos-moos
```

That needs sudo and rebuilds the initramfs.

## Wallpaper

| File | Role |
|:---|:---|
| `backgrounds/0-moor.png` | Moor still, with its intro in `backgrounds/intros/0-moor.mp4` (6 s, hills fold up out of the dark) |
| `backgrounds/1-moor-loop.mp4` | Moor animated: 40 s seamless loop, 1080p30 H.264 |
| `backgrounds/BG1.jpg` … `BG4.jpg` | Original Dos Moos set |

Cycle with the usual next-background shortcut or `omarchy theme bg next`. Extra wallpapers of your own go in `~/.config/omarchy/backgrounds/dos-moos/`.

### Intro, then animation

Omarchy 4.5 plays a background intro only before a still, never before a video. Dos Moos works around that so you get both:

- Pick `1-moor-loop.mp4` once. From then on, every login plays the intro and hands over to the loop. The still is the intro's last frame and the loop's first, so the switch doesn't show.
- How: when the session ends on the loop, `hyprland.lua` saves `0-moor.png` as the background. At the next login, Omarchy plays that still's intro, and `moor-handoff.sh` switches to the loop once the intro ends.
- Switching to Dos Moos from another theme brings back whichever Moor background you last used, without the intro handoff.
- Pick `0-moor.png` on purpose and it stays a still with its intro. Every other background is left alone.
- With background intros or animations turned off, you go straight to the loop.

The loop is decoded on the GPU. To save battery, set `battery_mode = "pause"` (or `"poster"`) in `~/.config/owe/config.toml` (see `/usr/share/doc/owe/config.toml.example`), then run `owe reload-config`.

## Palette

| Role | Hex |
|:---|:---|
| Background | `#131516` |
| Foreground (linen) | `#F8EBE3` |
| Accent (muted sage) | `#819890` |
| Border (ash gray) | `#A5B5AB` |
| Cursor / yellow | `#F4E276` |
| Red | `#F0334A` |
| Muted (secondary text, comments) | `#72856C` |
| Selection (completion menus) | `#35352D` |

Shell menu selection uses sage, not yellow.

## Unlock preview

<p align="center">
  <img src="./preview-unlock.png" alt="Dos Moos Plymouth unlock preview" width="720" />
</p>

## License

MIT. Original theme © 2026 HANCORE. Modifications © 2026 Elliot Moreau.

The bundled wallpapers remain the property of their original owners where that applies.
