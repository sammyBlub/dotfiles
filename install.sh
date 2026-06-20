set -e

REPO="https://github.com/sammyBlub/dotfiles.git"
DIR="$HOME/.dotfiles"
CONFIG="$HOME/.config"
BACKUP="$HOME/.config_backup"

echo "Arch Hypr dotfiles installer"

read -p "Install Hyprland apps? (y/n): " apps
read -p "Install dotfiles? (y/n): " dots

if [ "$apps" = "y" ]; then
    sudo pacman -Sy --noconfirm \
        hyprpaper \
        waybar \
        wofi \
        grim \
        slurp \
        wl-clipboard \
        cliphist \
        hyprland
fi

if [ "$dots" = "y" ]; then
    [ -d "$DIR" ] || git clone "$REPO" "$DIR"

    mkdir -p "$BACKUP"

    for f in "$DIR/.config/"*; do
        name=$(basename "$f")

        [ -e "$CONFIG/$name" ] && mv "$CONFIG/$name" "$BACKUP/"

        ln -sf "$f" "$CONFIG/$name"
    done

    echo "Done."
fi