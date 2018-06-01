#!/usr/bin/env bash

DOTVIM_DIR=$HOME/.vim
if [ ! -d "$DOTVIM_DIR/autoload/plug.vim" ]; then
    echo "install vim-plug start ...."
    curl -fLo $DOTVIM_DIR/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "install vim-plug end ...."
else
    echo "vim-plug already installed"
fi

ln -sf "$DOTVIM_DIR/.vimrc" "$HOME/.vimrc" 

# Install pluging
echo "vim pnstall plugin start..."
vim +PlugInstall +qall
echo "vim pnstall plugin end..."
