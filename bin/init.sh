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
.bashrc
.tmux.conf
.zsh
.rbenv
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
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall! +q

# vimproc setup
cd ~/dotfiles/.vim/bundle/vimproc/
case $OSTYPE in
    darwin* )    make -f make_mac.mak ;;
    linux-gnu )  make -f make_unix.mak ;;
esac

curl -L http://xrl.us/perlbrew >/usr/local/bin/perlbrew
chmod 755 /usr/local/bin/perlbrew

/usr/local/bin/perlbrew init

# bin file setup
cp -p ~/dotfiles/bin/alc /usr/local/bin/

