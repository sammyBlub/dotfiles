#!/bin/bash
set -e

REPO="https://github.com/sammyBlub/dotfiles.git"
DIR="$HOME/sammyfiles"
CONFIG="$HOME/.config"
BACKUP="$HOME/.config_backup"

cat <<'BANNER'
                                           ___    _____  _____ 
                                          |  _`\ (  _  )(_   _)
  ___    _ _   ___ ___    ___ ___   _   _ | (_) )| (_) |  | |  
/',__) /'_` )/' _ ` _ `\/' _ ` _ `\( ) ( )| ,  / |  _  |  | |  
\__, \( (_| || ( ) ( ) || ( ) ( ) || (_) || |\ \ | | | |  | |  
(____/`\__,_)(_) (_) (_)(_) (_) (_)`\__, |(_) (_)(_) (_)  (_)  
                                   ( )_| |                     
                                   `\___/'                     
BANNER
echo "this is the coolest rat pls install it"

read -p "install cool apps? (y/n): " apps
read -p "install the coolest configs? (y/n): " dots

if [ "$apps" = "y" ]; then
    yay -Sy --noconfirm \
        swww \
        waybar \
        wofi \
        grim \
        slurp \
        wl-clipboard \
        cliphist \
        hyprland \
        dunst \
        kitty \
        fastfetch \
        grimblast \
        xdg-desktop-portal \
        xdg-desktop-portal-gtk \
        xdg-desktop-portal \
        zen-browser-bin \
        kitty \
        nautilus
fi

if [ "$dots" = "y" ]; then
    if [ ! -d "$DIR" ]; then
        git clone "$REPO" "$DIR"
    fi

    mkdir -p "$BACKUP"

    for f in "$DIR/.config/"*; do
        name=$(basename "$f")

        if [ -e "$CONFIG/$name" ]; then
            mv "$CONFIG/$name" "$BACKUP/"
        fi

        cp -rp "$f" "$CONFIG/$name"
    done

    if [ -f "$DIR/.bashrc" ]; then
        if [ -f "$HOME/.bashrc" ]; then
            mv "$HOME/.bashrc" "$HOME/bashrc.bak"
        fi
        cp -p "$DIR/.bashrc" "$HOME/.bashrc"
        echo "ooo .bashrc copied yay."
    else
        echo "evil .bashrc has been deleted oh no"
    fi

    echo "muhahahaa i ratted ur pc aaaaa"
fi
