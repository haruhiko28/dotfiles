#!/bin/sh

# install atom packages

# react
apm install react language-javascript-jsx
# -- snippetsの設定ファイルを移動する
yes | cp ./atom/JavaScript\ \(JSX\).cson ~/.atom/packages/react/snippets/

# eslint
apm install busy-signal es6-javascript intentions linter linter-eslint linter-ui-default

# ftp
apm install remote-ftp

# icon
apm install file-icons
