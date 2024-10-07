#!/bin/sh

# git clone git://github.com/atani/dotfiles.git 
# の後に流し、ホームディレクトリをgithubに置いてあるものに置き換える

# gitで管理するファイルリスト
FILELIST="
.vim
bin
.bash_profile
.git-completion.bash
.gitignore
.gitconfig
.vimrc
.zshrc
.zsh
.anyenv
.peco
"

# 必要ディレクトリの作成
cd ~
mkdir bin tmp src 
touch ~/.zsh/`hostname`.zsh
touch ~/.vimrc.local

# 既存ディレクトリ、ファイルを待避させる
if [ ! -e ~/old_files ]; then
    mkdir ~/old_files
    for FILE in ${FILELIST};
    do
        mv -iv ~/${FILE} ~/old_files/
    done
fi

# link張り直し
for FILE in ${FILELIST};
do
    rm -rf ~/${FILE}
    ln -s ~/ghq/github.com/atani/dotfiles/${FILE} ~/${FILE}
done

# git submodule init & update
cd ~/ghq/github.com/atani/dotfiles
git submodule init
git submodule update

# Bundleinstall 
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall! +q

# vimproc setup
cd ~/ghq/github.com/atani/dotfiles/.vim/bundle/vimproc/
case $OSTYPE in
    darwin* )    make -f make_mac.mak ;;
    linux-gnu )  make -f make_unix.mak ;;
esac

# bin file setup
cp -p ~/ghq/github.com/atani/dotfiles/bin/alc /usr/local/bin/

# anyenv
git clone https://github.com/riywo/anyenv ~/ghq/github.com/atani/dotfiles/.anyenv

exec $SHELL -l
