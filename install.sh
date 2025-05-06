#!/bin/bash

echo "Creating symlinks for dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"

mkdir -p "$BACKUP_DIR"

link_file() {
    src="$DOTFILES_DIR/$1"
    dest="$HOME/$2"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$dest")"

    # Backup files
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # Ensure source file exists
    if [ ! -e "$src" ] || [ ! -s "$src" ]; then
        echo "  ERROR: $src does not exist or is empty! Skipping."
        return
    fi

    # symlink
    ln -sf "$src" "$dest"

    if [ -L "$dest" ]; then
        echo "  Linked $src → $dest"
    else
        echo "  ERROR: Failed to link $src"
    fi
}

FILES=(
    "zsh/.zshrc .zshrc"
    "vim/.vimrc .vimrc"
    "i3/config .config/i3/config"
    "zathura/zathurarc .config/zathura/zathurarc"
    "kitty/kitty.conf .config/kitty/kitty.conf"
)

for entry in "${FILES[@]}"; do
    link_file $entry
done

echo "Dotfiles installed!"
