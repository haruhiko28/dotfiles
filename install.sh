#!/bin/bash

# 各shファイルに実行権限を与える
for file in `\find . -maxdepth 1 -type f`; do
    # バッククォートの位置に注意
    # ちゃんとechoからくくること
    extension=`echo $file | sed 's/^.*\.\([^\.]*\)$/\1/'`
    if [ "sh" = $extension ]; then
        `chmod 755 $file`
        echo "changed mode 755: $file"
    fi
done

# zshのinstall
./zshinit.sh

# zshを起動してpreztoをinstallする
./preztoinit.sh

# vim周りの設定
./viminit.sh

# 設定ファイルのコピー
./set_dotfiles.sh

# zsh再起動
echo '================== Reboot shell =================='
exec $SHELL -l
