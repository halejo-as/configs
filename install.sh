#!/bin/bash
############# DEBUG ####################

GREEN='\033[0;32m'
NC='\033[0m'
printMessage(){
  echo -e "$GREEN $1 $NC"
}

############# SCRIPT #################
# optional TODO: think the correct way to pass the bashrc
rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc

# install editors, git and tmux
sudo apt install -y  git vim curl tree tmux

############# NEOVIM #################
# install last version neovim 0.4.4       
if ! command -v nvim &> /dev/null
then
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable  
    sudo apt-get update                            
    sudo apt-get install -y neovim
else
  printMessage "neovim installed"
fi

############# COC #################
#install node to use coc in nvim
if ! command -v node -v &> /dev/null
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  # TODO: should log out to detect nvm 
  # download and install Node.js
  nvm install 20
  # verifies the right Node.js version is in the environment
  node -v # should print `v20.12.1`
  # verifies the right NPM version is in the environment
  npm -v # should print `10.5.0`
else
  printMessage "coc installed"
fi
# :call coc#util#install()
########## CONFIG NVIM ###########

NVIM_DIR=~/.config/nvim

if [[ -d "$NVIM_DIR" ]]
then
	printMessage "nvim dir already created $NVIM_DIR"
else
  mkdir ~/.config/nvim
  touch ~/.config/nvim/init.vim
  echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >>  ~/.config/nvim/init.vim
  echo "let &packpath=&runtimepath" >> ~/.config/nvim/init.vim
  echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
  # install plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  printMessage "nvim dir created $NVIM_DIR"
  command nvim +PlugInstall +qall & 
  CocCommand clangd.install
  #in nvim --> :call coc#util#install()
fi

# set neo vim as default editor 
if [ -z ${EDITOR} ]
then
  echo export EDITOR='nvim' >> ~/.bashrc
  echo export VISUAL='nvim' >> ~/.bashrc
  printMessage "Set nvim as default EDITOR"
fi


#shortcuts 
rm ~/.vimrc
rm ~/.tmux.conf
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.tmux.conf ~/.tmux.conf


########## ROS 2 ###########

##set locale
#locale  # check for UTF-8
#sudo apt update && sudo apt install locales
#sudo locale-gen en_US en_US.UTF-8
#sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#export LANG=en_US.UTF-8
#locale  # verify settings
#
##setup sources
#sudo apt update && sudo apt install -y curl gnupg2 lsb-release
#sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
#
##install ros 2
#sudo apt update
#sudo apt install -y ros-foxy-desktop #ros-foxy-ros-base
#sudo apt install -y python3-argcomplete
#sudo apt install -y python3-colcon-common-extensions
##install ros2 packages
#sudo apt install ros-foxy-ros2-control \
#                 ros-foxy-ros2-controllers \
#                 ros-foxy-gazebo-ros-pkgs
#echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
#echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
#echo "export _colcon_cd_root=/opt/ros/foxy/share/" >> ~/.bashrc


