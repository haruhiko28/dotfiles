#!/bin/bash

# その他，各種設定ファイルをhomeにコピーする

# tmux
echo '================== copy tmux.config =================='
cp .tmux.conf ~

# gitconfig
echo '================== copy gitconfig =================='
cp .gitconfig ~