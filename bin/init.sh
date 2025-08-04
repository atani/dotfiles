#!/bin/sh

# git clone git://github.com/atani/dotfiles.git 
# の後に流し、ホームディレクトリをgithubに置いてあるものに置き換える

brew bundle

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
mise
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
    ln -s ~/src/github.com/atani/dotfiles/${FILE} ~/${FILE}
done

# git submodule init & update
cd ~/src/github.com/atani/dotfiles
git submodule init
git submodule update

# Bundleinstall 
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
vim +NeoBundleInstall! +q

## nvimプラグイン管理用のlazy.nvimインストール
#mkdir -p ~/.config/nvim/lua
#git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
#
## nvim の設定
#ln -s ~/src/github.com/atani/dotfiles/neovim/plugins.lua ~/.config/nvim/lua/plugins.lua
#ln -s ~/src/github.com/atani/dotfiles/neovim/init.lua ~/.config/nvim/init.lua

# bin file setup
cp -p ~/src/github.com/atani/dotfiles/bin/alc /usr/local/bin/

# anyenv
#git clone https://github.com/riywo/anyenv ~/src/github.com/atani/dotfiles/.anyenv

# Weztermの設定ディレクトリを作成
mkdir -p ~/.config/wezterm

# 設定ファイルのシンボリックリンクを作成
ln -s ~/src/github.com/atani/dotfiles/terminal/wezterm.lua ~/.config/wezterm/wezterm.lua

# mise install
mise install

exec $SHELL -l
