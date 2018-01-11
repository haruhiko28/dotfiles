#!/bin/bash

# ==== まずは素のzshをinstallする ====

# OS 別の設定
case ${OSTYPE} in
    darwin*)
        # Mac用の設定
        echo '================== Install zsh with homebrew =================='
        brew install zsh
        echo '================== Update /etc/shells =================='
        sudo cp ./etc/shells /etc/
        # zshをデフォルトシェルに変更
        echo '================== Set /usr/local/bin/zsh as login shell =================='
        chsh -s /usr/local/bin/zsh
        ;;
    linux*)
        # Linux用の設定
        # TODO
        ;;
esac

# oh-my-zshは使わない
#wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
#cp .zshrc ~/.zshrc

# fzfを活用してTerminalの作業効率を高める
# 参考: https://qiita.com/kmszk/items/aa9920f07487559c0c7e
# fzfとはCLIでインクリメンタルに曖昧な検索が可能になるGO言語製のツール
# 標準出力をパイプでfzfコマンドで渡すだけで標準出力の内容を対象に検索できます
echo '================== Intall fzf =================='
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install


