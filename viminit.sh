#!/bin/bash

# NeoBundleのインストール
cp .vimrc ~
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#yes | yinst i ports/vim -b test