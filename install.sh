#!/bin/bash

cd `dirname $0`
PWD=`pwd`

echo "[+] Updating submodules"
git submodule update --init

echo "[+] Installing powerline-shell"

function require_pkg {
    if [ ! command -v $1 &> /dev/null ] && [ "`dpkg -l $1 | grep $1 | grep -v none`" == "" ] ; then
        echo "Please install '$1' first:"
        echo ""
        echo "        $ sudo apt-get install $1"

        exit 1
    fi
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    require_pkg vim
    require_pkg vim-gtk3
    require_pkg g++
    require_pkg git
    require_pkg cmake
    require_pkg python-setuptools
    require_pkg python3
    require_pkg python3-dev
    require_pkg python3-pip
fi

cd ./submodules/powerline-shell
sudo python3 setup.py install
cd ../../
#ln -f -s ${PWD}/submodules/powerline-shell/powerline-shell.py ~/.powerline-shell.py

echo "[+] Checking if ~/.config/powerline-shell exists"
if [ -e ~/.config/powerline-shell ] ; then
    echo "~/.config/powerline-shell already exists. Nothing to do"
else
    echo "[+] Creating ~/.config/powerline-shell symlink"
    ln -s ${PWD}/powerline-shell ~/.config/powerline-shell
fi

echo "[+] Checking if ~/.config/kitty exists"
if [ -e ~/.config/kitty ] ; then
    echo "~/.config/kitty already exists. Nothing to do"
else
    echo "[+] Creating ~/.config/kitty symlink"
    ln -s ${PWD}/kitty ~/.config/kitty
fi

if [[ "$OSTYPE" == "darwin" ]]; then
    ln -sf ${PWD}/kitty/kitty-macos.conf ${PWD}/kitty/local.conf
else
    ln -sf ${PWD}/kitty/kitty-linux.conf ${PWD}/kitty/local.conf
fi

echo "[+] Creating ~/.* symlinks"
ln -f -s ${PWD}/.vimrc ~/.vimrc
ln -f -s ${PWD}/.gvimrc ~/.gvimrc
ln -f -s ${PWD}/.myenv ~/.myenv
ln -f -s ${PWD}/.gdbinit ~/.gdbinit
ln -f -s ${PWD}/.gitconfig ~/.gitconfig

mkdir -p ~/.vim/swapfiles
mkdir -p ~/.vim/undodir

git update-index --assume-unchanged .gitconfig

echo "[+] Language server 'clangd' installation instructions"
echo "    sudo apt-get install clangd-10"
echo "    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 100"

echo "[+] Done"
