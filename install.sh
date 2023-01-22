#!/bin/bash

sudo apt install -y tmux
sudo apt install -y vim
sudo apt install -y ack-grep

git clone https://github.com/samoshkin/tmux-config.git
./tmux-config/install.sh
rm -rf tmux-config

mv ~/.vimrc ~/.vim/.vimrc-old
cp .vimrc ~/.vim/
ln -s ~/.vim/.vimrc ~/.vimrc

mv ~/.tmux/.tmux.conf ~/.tmux/tmux.conf-old
ln -s .tmux.conf ~/.tmux.conf

mkdir ~/.vim
mkdir ~/.vim/pack
mkdir ~/.vim/pack/bundle
mkdir ~/.vim/pack/bundle/opt
mkdir ~/.vim/pack/bundle/start
cd ~/.vim/pack/bundle/opt

declare -A packages=(
    ["ack.vim"]="https://github.com/mileszs/ack.vim"
    ["ale"]="https://github.com/w0rp/ale"
    ["ctrlsf.vim"]="https://github.com/dyng/ctrlsf.vim"
    ["fzf"]="https://github.com/junegunn/fzf.git"
    ["fzf.vim"]="https://github.com/junegunn/fzf.vim.git"
    ["nerdtree"]="https://github.com/scrooloose/nerdtree.git"
    ["nerdtree-git-plugin"]="https://github.com/Xuyuanp/nerdtree-git-plugin.git"
    ["vim-airline"]="https://github.com/vim-airline/vim-airline.git"
    ["vim-fugitive"]="https://github.com/tpope/vim-fugitive.git"
    ["typescript-vim"]="https://github.com/leafgarland/typescript-vim.git"
    ["vim-commentary"]="https://github.com/tpope/vim-commentary.git"
    ["vim-vue"]="https://github.com/posva/vim-vue.git"
)

for package in "${!packages[@]}";
do
    echo "installing $package - ${packages[$package]}";
    git clone ${packages[$package]};
    ln -s ~/.vim/pack/bundle/opt/$package ~/.vim/pack/bundle/start/$package;
done
