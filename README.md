# Weza's Dotfiles 🎨

Personal system customizations for Linux (Ubuntu/Debian-based with Niri compositor).

## What's Included

### 🖥️ Terminal
- **Alacritty** - GPU-accelerated terminal with custom "Dank" theme
- **Starship** - Cross-shell prompt with Nord-inspired styling
- **Bash** - Customized `.bashrc` with useful aliases and functions

### 🪟 Window Manager
- **Niri** - Scrollable-tiling Wayland compositor configuration
- Custom keybindings and layout settings

### 🎨 Theming
- **GTK 3/4** - Custom Material-style dark theme colors (generated with Matugen)
- **DankMaterialShell** - Shell/panel customization settings
- **Alacritty Dank Theme** - Dark purple/pink terminal colors

## Dependencies

```bash
# Core tools
sudo apt install alacritty starship zoxide fzf bat trash-cli fastfetch

# Fonts (install GeistMono Nerd Font)
# Download from: https://github.com/ryanoasis/nerd-fonts/releases

# Optional
sudo apt install pokemon-colorscripts  # Fun terminal greeting
```

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

2. **Bash & Starship**
   ```bash
   mkdir -p ~/.local/share/mybash
   cp bash/.bashrc ~/.local/share/mybash/
   cp bash/starship.toml ~/.local/share/mybash/
   ln -sf ~/.local/share/mybash/.bashrc ~/.bashrc
   ln -sf ~/.local/share/mybash/starship.toml ~/.config/starship.toml
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

5. **DankMaterialShell** (if using this GNOME/Niri extension)
   ```bash
   mkdir -p ~/.config/DankMaterialShell
   cp DankMaterialShell/* ~/.config/DankMaterialShell/
   ```

## Key Features

### Bash Aliases
- `cat` → `batcat` (syntax highlighted file viewer)
- `rm` → `trash` (safe delete to trash)
- `vim` → `nvim` (neovim)
- `..`, `...`, `....` - Quick directory navigation
- `lazyg "message"` - Git add, commit, and push in one command
- `Ctrl+F` - Launch zoxide interactive search

### Color Scheme
The "Dank" theme is a dark purple/pink aesthetic:
- Background: `#161217`
- Foreground: `#eae0e7`
- Accent: `#e6b6f1` (pink/purple)

## Structure

```
dotfiles/
├── alacritty/
│   ├── alacritty.toml      # Main config
│   └── dank-theme.toml     # Color theme
├── bash/
│   ├── .bashrc             # Shell config
│   └── starship.toml       # Prompt config
├── niri/
│   ├── config.kdl          # Window manager config
│   └── dms/                # Additional bindings
├── gtk-3.0/
│   └── dank-colors.css     # GTK3 theme colors
├── gtk-4.0/
│   └── dank-colors.css     # GTK4 theme colors
├── DankMaterialShell/
│   ├── settings.json       # Panel/shell settings
│   └── firefox.css         # Firefox styling
├── install.sh              # Auto-installer
└── README.md
```

## License

Feel free to use and modify these configs! 🚀
