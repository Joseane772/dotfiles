# Weza's Dotfiles 🎨

Personal system customizations for Linux (CachyOS, Arch-based, Niri compositor).

## What's Included

### 🖥️ Terminal
- **Alacritty** - GPU-accelerated terminal with custom "Dank" theme (GeistMono Nerd Font)
- **Fish** - Shell config on top of CachyOS's default fish setup

### 🪟 Window Manager & Shell
- **Niri** - Scrollable-tiling Wayland compositor configuration
- **[DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell)** - the actual desktop shell (Quickshell-based) running on top of Niri: panel, notifications, control center, plugins. Installed and managed via **[DankLinux](https://github.com/dvkellerman/danklinux)**.
- Custom keybindings, layout, output, and blur settings (all generated/managed by DankMaterialShell into `niri/dms/`)

### 🎨 Theming
- **GTK 3/4** - Material-You dark theme colors (generated with Matugen)
- **DankMaterialShell** - Shell/panel settings, plugin config, clipboard history settings, Firefox styling
- **Alacritty Dank Theme** - Dark purple/pink terminal colors

## Dependencies

```bash
# Core tools (CachyOS/Arch)
sudo pacman -S alacritty fish niri

# DankMaterialShell (the actual panel/shell for niri) — install via DankLinux:
# https://github.com/dvkellerman/danklinux

# Fonts (install GeistMono Nerd Font)
# Download from: https://github.com/ryanoasis/nerd-fonts/releases
```

Note: this setup does not use Starship. The prompt comes from CachyOS's default fish configuration (`cachyos-fish-config`), sourced at the top of `fish/config.fish`.

## Installation

### Quick Install
```bash
./install.sh
```

### Manual Installation

1. **Alacritty**
   ```bash
   mkdir -p ~/.config/alacritty
   cp alacritty/* ~/.config/alacritty/
   ```

2. **Fish**
   ```bash
   mkdir -p ~/.config/fish
   cp fish/config.fish ~/.config/fish/
   ```

3. **Niri** (if using Niri compositor)
   ```bash
   mkdir -p ~/.config/niri
   cp -r niri/* ~/.config/niri/
   ```

4. **GTK Themes**
   ```bash
   mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
   cp gtk-3.0/dank-colors.css ~/.config/gtk-3.0/
   cp gtk-4.0/dank-colors.css ~/.config/gtk-4.0/
   ```

5. **DankMaterialShell**
   ```bash
   mkdir -p ~/.config/DankMaterialShell
   cp DankMaterialShell/* ~/.config/DankMaterialShell/
   ```

## Key Features

### Fish Config
- Sources CachyOS's default fish config for prompt, completions, and greeting
- `text` aliased to `gnome-text-editor`

### Color Scheme
The "Dank" theme is a dark purple aesthetic, Matugen-generated from the current wallpaper:
- Background: `#151218`
- Foreground: `#e8e0e8`
- Accent (cursor/cyan): `#dabaf9`

## Structure

```
dotfiles/
├── alacritty/
│   ├── alacritty.toml      # Main config
│   └── dank-theme.toml     # Color theme
├── fish/
│   └── config.fish         # Shell config
├── niri/
│   ├── config.kdl          # Window manager config
│   └── dms/                # Outputs, layout, binds, colors, blur (DankMaterialShell-managed)
├── gtk-3.0/
│   └── dank-colors.css     # GTK3 theme colors
├── gtk-4.0/
│   └── dank-colors.css     # GTK4 theme colors
├── DankMaterialShell/
│   ├── settings.json       # Panel/shell settings
│   ├── clsettings.json     # Clipboard history settings
│   ├── plugin_settings.json # Plugin toggles (KDE Connect, notepad, pomodoro, etc.)
│   └── firefox.css         # Firefox styling
├── install.sh              # Auto-installer
└── README.md
```

## License

Feel free to use and modify these configs! 🚀