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

Dark forest greens, ash-gray borders, and warm linen on `#131516`. The default wallpaper is a moody hill landscape with a darkened sky so the top bar stays readable.

Based on [HANCORE's Dos-Moos](https://github.com/HANCORE-linux/omarchy-dos-moos-theme), with a default hills wallpaper, a custom Plymouth unlock screen, sage menu selection, and slightly translucent windows.

## Install

```bash
omarchy theme install https://github.com/cempack/omarchy-dos-moos-theme.git
```

Or from the Omarchy menu: **Super + Alt + Space** → **Install → Style → Theme**, paste the URL, press Enter.

That clones the theme, applies it, and names it **Dos Moos**.

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

### Rounded corners and window opacity (optional)

Omarchy drops `hyprland.lua` from cloned themes. If you want 12px rounding and the tuned window opacity, append `extras/looknfeel.lua` to `~/.config/hypr/looknfeel.lua`, then `hyprctl reload`.

## Wallpaper

| File | Role |
|:---|:---|
| `backgrounds/0-dark-hills.jpg` | Default — overcast hills, sky darkened for the top bar |
| `backgrounds/BG1.jpg` … `BG4.jpg` | Original Dos Moos set |

Cycle with the usual next-background shortcut or `omarchy theme bg next`. Extra wallpapers of your own go in `~/.config/omarchy/backgrounds/dos-moos/`.

## Palette

| Role | Hex |
|:---|:---|
| Background | `#131516` |
| Foreground (linen) | `#F8EBE3` |
| Accent (muted sage) | `#819890` |
| Border (ash gray) | `#A5B5AB` |
| Cursor / yellow | `#F4E276` |
| Red | `#F0334A` |

Menu selection uses sage, not yellow.

## Unlock preview

<p align="center">
  <img src="./preview-unlock.png" alt="Dos Moos Plymouth unlock preview" width="720" />
</p>

## License

MIT. Original theme © 2026 HANCORE. Modifications © 2026 Elliot Moreau.

The bundled wallpapers remain the property of their original owners where that applies.
