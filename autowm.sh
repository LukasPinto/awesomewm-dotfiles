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
git clone git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build installi


echo -e "Instalando HackNerdFonts"
cd ..
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
sudo bash -c "cd /usr/local/share/fonts/; mv $repo_path/install/Hack.zip . ; unzip Hack.zip; rm Hack.zip;fc-cache -v"


echo -e "Instalando Alacritty"
sudo apt install alacritty

echo -e "Instalando tmux"
sudo apt instal tmux

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





