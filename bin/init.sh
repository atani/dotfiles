#!/bin/sh

# git clone git://github.com/glidenote/dotfiles.git 
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
.bashrc
.tmux.conf
.zsh
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
        mv ~/${FILE} ~/old_files/
    done
fi

# link張り直し
for FILE in ${FILELIST};
do
    rm -rf ~/${FILE}
    ln -s ~/dotfiles/${FILE} ~/${FILE}
done

# git submodule init & update
cd ~/dotfiles
git submodule init
git submodule update

# Bundleinstall 
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall! +q

# vimproc setup
cd ~/dotfiles/.vim/bundle/vimproc/
case $OSTYPE in
    darwin11.3.0 ) make -f make_mac.mak ;;
    linux-gnu )    make -f make_unix.mak ;;
esac
