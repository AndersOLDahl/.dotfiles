#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"
vundle="$HOME/.dotfiles/vim/bundle/Vundle.vim"

# to error out
warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

echo "Installing/Updating dotfiles...\n"

if [ ! -e $dotfiles/.git ]; then
    echo "Cloning dotfiles\n"
    git clone https://github.com/AndersOLDahl/dotfiles.git $dotfiles
else
    echo "Updating dotfiles\n"
    cd $dotfiles && git pull
fi

# zsh
echo "Setting up zsh...\n"
lnif $dotfiles/zshrc $HOME/.zshrc

# tmux
echo "Setting up tmux...\n"
lnif $dotfiles/tmux.conf $HOME/.tmux.conf

# git
echo "Setting up git...\n"
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore_global $HOME/.gitignore_global

# ssh
echo "Setting up ssh config...\n"
lnif $dotfiles/config $HOME/.ssh/config

# vim
echo "Setting up vim...\n"
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/vim $HOME/.vim

# atom
echo "Setting up atom...\n"
lnif $dotfiles/atom $HOME/.atom

# Update vim bundles
if [ ! -e $dotfiles/vim/bundle/Vundle.vim ]; then
    echo "Cloning Vundle\n"
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle
else
    echo "Updating dotfiles\n"
    cd $vundle && git pull
fi

echo "Update/Install plugins using vundle"
vim +PluginInstall +qall
