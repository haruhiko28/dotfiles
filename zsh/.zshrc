#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# ==== エイリアス ====

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# ---- find系 ----
alias findr='find ./ -name'

# ---- grep系 ----

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# git系 エイリアス
alias gadd='git add'
alias gcm='git commit -m'
alias gco='git checkout'
alias gbr='git branch -a'
alias glog='git log --oneline'
alias gill='git pull'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# shellの再起動
alias relogin='exec $SHELL -l'

# 解凍周りのエイリアス
# ./filenameで解凍
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# hosts設定
if which pbcopy >/dev/null 2>&1 ; then
  # Mac用
  alias chhost='sudo vi /private/etc/hosts'
  alias rehost='sudo killall -HUP mDNSResponder'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  # TODO
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  # TODO
fi

# fzfの設定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
