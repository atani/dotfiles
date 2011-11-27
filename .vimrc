" タイトルをウインドウ枠に表示
set title
" ルーラーを表示
set ruler
 
""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
	  set nowrap
  endfunction

filetype off

if has('vim_starting')
    set runtimepath+=~/.bundle/neobundle.vim
    call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'https://github.com/h1mesuke/unite-outline.git'
NeoBundle 'https://github.com/kana/vim-smartchr.git'
NeoBundle 'https://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/mattn/zencoding-vim.git'
NeoBundle 'https://github.com/othree/eregex.vim.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/ujihisa/shadow.vim.git'
NeoBundle 'https://github.com/vim-scripts/delphi.vim.git'
NeoBundle 'https://github.com/vim-scripts/JSON.vim.git'
NeoBundle 'https://github.com/vim-scripts/TwitVim.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'https://github.com/rickard/project.vim.git'

filetype plugin on
filetype indent on

