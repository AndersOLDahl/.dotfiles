#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

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
echo "Setting up bash...\n"
lnif $dotfiles/zshrc $HOME/.zshrc

# git
echo "Setting up git...\n"
lnif $dotfiles/gitconfig $HOME/.gitconfig
lnif $dotfiles/gitignore_global $HOME/.gitignore_global

# vim
echo "Setting up vim...\n"
lnif $dotfiles/vimrc $HOME/.vimrc
lnif $dotfiles/vim $HOME/.vim

# tmux
echo "Setting up tmux...\n"
lnif $dotfiles/tmux.conf $HOME/.tmux.conf

# ssh
echo "Setting up ssh config...\n"
lnif $dotfiles/config $HOME/.ssh

echo "Update/Install plugins using vundle"
vim +PluginInstall +qall
