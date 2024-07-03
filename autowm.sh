#!/bin/bash


if [ -z "$1" ];then
	echo -e "usage  ./autowm.sh \"[USER]\""
	exit 1

fi


repo_path=$(pwd)

echo -e  "Instalando AwesomWM"
sudo apt install awesome awesome-extra awesome-doc -y



mkdir install
cd install


echo -e  "Instalando Picom"
git clone https://github.com/ibhagwan/picom.git
cd picom/
sudo apt install -y cmake libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libpcre3-dev


git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install


echo -e "Instalando HackNerdFonts"
cd ..
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
sudo bash -c "cd /usr/local/share/fonts/; mv $repo_path/install/Hack.zip . ; unzip Hack.zip; rm Hack.zip;fc-cache -v"


echo -e "Instalando Alacritty"
sudo apt install alacritty

echo -e "Instalando tmux"
sudo apt install tmux

echo -e "Configurando zsh"
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo -e "Instalando rofi"
sudo apt install rofi

echo -e "Instalando fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "Instalamos ranger"
sudo apt install ranger





