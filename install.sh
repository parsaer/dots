#!/bin/bash

echo "Creating symlinks for dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"

mkdir -p "$BACKUP_DIR"

link_file() {
    src="$DOTFILES_DIR/$1"
    dest="$HOME/$1"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$dest")"

    # Backup existing files
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # Ensure source file exists and is not empty
    if [ ! -e "$src" ] || [ ! -s "$src" ]; then
        echo "  ERROR: $src does not exist or is empty! Skipping."
        return
    fi

    # Create symlink
    ln -sf "$src" "$dest"
    
    # Verify if symlink was created correctly
    if [ -L "$dest" ]; then
        echo "  Linked $src -> $dest"
    else
        echo "  ERROR: Failed to create symlink for $src"
    fi
}

# List of files to symlink
FILES=(
    "zsh/.zshrc"
    "vim/.vimrc"
    "i3/config"
    "zathura/zathurarc"
)

# Create symlinks
for file in "${FILES[@]}"; do
    link_file "$file"
done

echo "Dotfiles installed!"
