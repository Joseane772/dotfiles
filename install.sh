#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks for all configuration files

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🎨 Installing dotfiles from $DOTFILES_DIR"
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

backup_and_link() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo -e "${YELLOW}Backing up existing $dest to ${dest}.bak${NC}"
        mv "$dest" "${dest}.bak"
    elif [ -L "$dest" ]; then
        rm "$dest"
    fi
    
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
    echo -e "${GREEN}✓ Linked $dest${NC}"
}

# Alacritty
echo "📺 Installing Alacritty config..."
mkdir -p ~/.config/alacritty
backup_and_link "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
backup_and_link "$DOTFILES_DIR/alacritty/dank-theme.toml" ~/.config/alacritty/dank-theme.toml

# Bash & Starship
echo ""
echo "🐚 Installing Bash and Starship config..."
mkdir -p ~/.local/share/mybash
backup_and_link "$DOTFILES_DIR/bash/.bashrc" ~/.local/share/mybash/.bashrc
backup_and_link "$DOTFILES_DIR/bash/starship.toml" ~/.local/share/mybash/starship.toml
backup_and_link ~/.local/share/mybash/.bashrc ~/.bashrc
backup_and_link ~/.local/share/mybash/starship.toml ~/.config/starship.toml

# Niri (optional - only if directory exists)
if [ -d "$DOTFILES_DIR/niri" ]; then
    echo ""
    echo "🪟 Installing Niri config..."
    mkdir -p ~/.config/niri
    backup_and_link "$DOTFILES_DIR/niri/config.kdl" ~/.config/niri/config.kdl
    if [ -d "$DOTFILES_DIR/niri/dms" ]; then
        cp -r "$DOTFILES_DIR/niri/dms" ~/.config/niri/
        echo -e "${GREEN}✓ Copied niri/dms directory${NC}"
    fi
fi

# GTK themes
echo ""
echo "🎨 Installing GTK theme colors..."
mkdir -p ~/.config/gtk-3.0 ~/.config/gtk-4.0
backup_and_link "$DOTFILES_DIR/gtk-3.0/dank-colors.css" ~/.config/gtk-3.0/dank-colors.css
backup_and_link "$DOTFILES_DIR/gtk-4.0/dank-colors.css" ~/.config/gtk-4.0/dank-colors.css

# DankMaterialShell (optional)
if [ -d "$DOTFILES_DIR/DankMaterialShell" ]; then
    echo ""
    echo "🖼️ Installing DankMaterialShell config..."
    mkdir -p ~/.config/DankMaterialShell
    for file in "$DOTFILES_DIR/DankMaterialShell"/*; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            backup_and_link "$file" ~/.config/DankMaterialShell/"$filename"
        fi
    done
fi

echo ""
echo "✅ Dotfiles installation complete!"
echo ""
echo "📝 Notes:"
echo "   - Existing files were backed up with .bak extension"
echo "   - Restart your terminal or run 'source ~/.bashrc' to apply changes"
echo "   - Make sure you have the required dependencies installed (see README.md)"
