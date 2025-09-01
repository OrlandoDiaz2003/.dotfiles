#!/bin/bash

set -e
sudo apt update -y && sudo apt upgrade -y

sudo apt install stow tmux zsh git gcc clang cmake make fzf ripgrep npm zip unzip build-essential

git clone https://github.com/neovim/neovim.git $HOME/neovim

cd $HOME/neovim/
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd $HOME/.dotfiles/
stow nvim
stow tmux
stow git

cd $HOME
RUNZSH=no CHSH=no sh -c \
	"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s "$(which zsh)"

rm -f ~/.zshrc

cd $HOME/.dotfiles
stow zsh
stow scripts

# --- Super + Enter → Terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
	"['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'gnome-terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'


# --- Super + D → Ocultar todas las apps (show desktop)
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

# --- Super + E → Abrir file manager
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"

# --- Super + F → Pantalla completa
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# --- Super + Shift + Q → Cerrar app
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# --- Alt + Tab → Cambiar entre ventanas directamente (no aplicaciones)
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"

for i in {1..9}; do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
	gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"
gsettings set org.gnome.shell.keybindings switch-to-application-10 "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"


