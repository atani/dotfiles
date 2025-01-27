## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

# Command history
bindkey -e
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## change ¥ -> \
bindkey -s '¥' '\\'

# コマンドの開始時のタイムスタンプ(エポックからの秒数)と実行時間(秒単位)をヒストリに含める。
setopt extended_history
function history-all { history -E 1 }

# Path
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:$PATH

# ghq Settings
git config --global ghq.root '~/src'

# Set prompt
autoload colors
colors

# ブランチ名をプロンプトに表示する。
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

local p_branch="%1(v|%F{green}%1v%f|)"

case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') $p_branch%B%{${fg[red]}%}%/#%{${reset_color}%}%b"$'\n'"# "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="[%D %T]$p_branch%{${fg[red]}%}%/%{${reset_color}%} "$'\n'"# "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

setopt auto_cd # auto change directory
setopt auto_pushd # auto directory pushd that you can get dirs list by cd -[tab]
setopt correct # command correct edition before each completion attempt
setopt list_packed # compacked complete list display
setopt noautoremoveslash # no remove postfix slash of command line
setopt nolistbeep # no beep sound when complete list displayed
setopt nonomatch

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
#setopt complete_aliases     # aliased ls needs if file/dir completions work
export ABBR_NO_MESSAGES=1
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

{
  abbr -S l='eza'
  abbr -S ll='eza -l'
  abbr -S v='vim'
  abbr -S g='git'
  abbr -S gi='git'
  abbr -f -S gs='git status'
  abbr -S gb='git branch'
  abbr -f -S gd='git diff'
  abbr -S gc='git checkout'
  abbr -S gci='git commit -m "'
  abbr -S gpm='git pull origin $(git branch --list | grep -q "main" && echo main || echo master)'
  abbr -S gp='git pull origin'
  abbr -S bi='brew install'
  abbr -S bu='brew uninstall'
  abbr -S bl='brew list'
  abbr -S b='bat'
  abbr -S d='docker'
  abbr -S doc='docker-compose'
  abbr -S j='z'
  abbr -S ji='zi'
  abbr -f -S grep='rg'
  abbr -f -S sed='sd'
  abbr -f -S man='tldr'
  abbr -f -S rm='trash'
  abbr -f -S cat='bat'
  abbr -f -S find='fd'
  abbr -f -S curl='https'
  abbr -f -S vim='nvim'
} >/dev/null 2>&1

## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# sshのホスト名をknown_hostsから補完する
function print_known_hosts (){
    if [ -f $HOME/.ssh/known_hosts ]; then
        cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
    fi  
}
_cache_hosts=($( print_known_hosts ))

#=============================
# source zsh-syntax-highlighting
#=============================
[ ! -d ~/.zsh ] && mkdir ~/.zsh
[ ! -d ~/.zsh/zsh-syntax-highlighting ] \
&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#=============================
# anyenv
#=============================
if [ -d $HOME/.anyenv ] ; then
    export PATH="$PATH:$HOME/.anyenv/bin"
    eval "$(anyenv init -)"
fi

#=============================
# Auto rbenv rehash
#=============================
[[ -d ~/.rbenv ]] && \
export PATH=$PATH:${HOME}/.rbenv/bin && \
eval "$(rbenv init -)"

function gem(){
    $RBENV_ROOT/shims/gem $*
    if [ "$1" = "install" ] || [ "$1" = "i" ] || [ "$1" = "uninstall" ] || [ "$1" = "uni" ]
    then
        rbenv rehash
        rehash
    fi
}

#=============================
# OS Judgment
#=============================
case ${OSTYPE} in
    darwin*)
        export HOMEBREW_CASK_OPTS="--appdir=/Applications"
        ;;
    linux*)
        #ここにLinux向けの設定
        ;;
esac

#=============================
# peco history
#=============================
function peco-select-history() {
    local gtac
    if which gtac > /dev/null; then
        gtac="gtac"
    else
        gtac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $gtac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#=============================
# peco git log
#=============================
function peco-git-hashes () {
    local selected="$(git log --format="%ai  %h  %an  %d %s" | peco)"
    if [ -n "$selected" ]; then
        local remote="$(git remote -v | grep fetch | awk '{print $2}' | \
            perl -pe 's/ssh:\/\///' | perl -pe 's/:/\//' | perl -pe 's/git@/https:\/\//' | perl -pe 's/\.git$//')"
        local url="${remote}/commit/$(echo $selected | \
            awk 'match($0,/[[:blank:]]{2}[a-z0-9]{7}[[:blank:]]{2}/) { print substr($0, RSTART+2, RLENGTH-2) }')"

        if [ -x "`which pbcopy`" ]; then
            echo "${url}" | pbcopy
            BUFFER="open ${url}"
            CURSOR=$#BUFFER
            zle accept-line
        else
            BUFFER="open ${url}"
            CURSOR=$#BUFFER
        fi
    fi
    zle clear-screen
}
zle -N peco-git-hashes
bindkey '^o' peco-git-hashes

#=============================
# peco directory search
#=============================
function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^t' peco-src

#=============================
# go path
#=============================
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

#=============================
# Include
#=============================
[ -f ~/.zshrc.include ] && source ~/.zshrc.include

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#=============================
# use zoxide
#=============================
eval "$(zoxide init zsh)"

export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
