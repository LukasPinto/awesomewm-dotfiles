# awesomewm-dotfiles

This is my configuration for AwesomeWM.

# Install

### Considerations

- I tried this configurations and `autowm.sh` in kali linux. They Should work in others distributions based on Debian.
- I Assume that you have your system in English. If not, you will need to edit the variable 'wallpaper' in `.config/awesome/main/user-variables.lua`  


If you want to use my configuration files, I recommend you run the script `autowm.sh` located in this repository. This script will install all
the necessary packages and dependencies.

Installing:

1. Clone the respository and run the script.
  ```bash
  git clone --recursive https://github.com/LukasPinto/awesomewm-dotfiles.git
  cd awesome-dotfiles
  ./autowm.sh $USER
   ```
2. When the script is running, it will ask you for the password and to enter `yes` or `y`. You have to enter your password and hit yes to everything.

3. Then when it says "Oh my Zsh" you need to type exit and then press Enter to continue with the installation, this will happen twice, once for your user and once for the root.


After these steps, you must log out and select the Awesome Window Manager.

# Keybinds
![image](https://github.com/LukasPinto/awesomewm-dotfiles/assets/73002372/63d3fdbe-57d2-4bff-9853-9f051940aba9)
