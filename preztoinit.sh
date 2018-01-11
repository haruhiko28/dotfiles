#!/usr/local/bin/zsh

# Preztoのレポジトリがすでに存在していた場合installがうまく行かないようなので消す
if [ -e ~/.zprezto ]; then
  rm -rf ~/.zprezto
fi

# Preztoの環境構築はzshで行わないといけないのでzshのインストールとは別ファイルで管理する
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 設定ファイルの移動
echo '================== Copy zsh configs =================='
yes | cp ./zsh/.* ~