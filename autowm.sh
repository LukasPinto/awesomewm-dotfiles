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
sudo apt install alacritty -y 

echo -e "Instalando tmux"
sudo apt install tmux -y
touch ~/.hushlogin
sudo bash -c 'touch ~/.hushlogin'

echo -e "Configurando zsh"
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo bash -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo bash -c 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'

sudo apt install zsh-syntax-highlighting zsh-autosuggestions
echo -e "Instalando rofi"
sudo apt install rofi -y

echo -e "Instalando fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Instalando lsd y batcat"
sudo apt install bat lsd

sudo bash -c 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf'
sudo bash -c '~/.fzf/install'
echo -e "Instalamos ranger"
sudo apt install ranger -y

cd $repo_path
echo 'creando config del usuario'
cp $repo_path/.config/* ~/.config -r
cp $repo_path/.tmux* ~/ -r
cp $repo_path/.zshrc ~/ 
cp $repo_path/.p10k.zsh ~/




echo "creando configs del usuario root, creando enlaces simbolicos al archivo del usuario $1"
# cuidado con esta linea, ya que sobreescribe lo que haya
sudo bash -c 'mkdir -p ~/.config'
sudo bash -c "ln -sf /home/$1/.config/alacritty ~/.config/alacritty"
sudo bash -c "ln -sf /home/$1/.tmux ~/.tmux"
sudo bash -c "ln -sf /home/$1/.tmux.conf ~/.tmux.conf"
sudo bash -c "ln -sf /home/$1/.tmux.conf.local ~/.tmux.conf.local"
sudo bash -c "ln -sf /home/$1/.zshrc ~/.zshrc"
sudo bash -c "ln -sf /home/$1/.p10k.zsh ~/.p10k.zsh"


rm -rf $repo_path/install
