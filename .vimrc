" vi との互換性OFF
set nocompatible

" ファイル形式の検出を無効にする
filetype off

" Vundle を初期化して
" Vundle 自身も Vundle で管理
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" github にあるプラグイン
Bundle 'h1mesuke/unite-outline.git'
Bundle 'kana/vim-smartchr.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'othree/eregex.vim.git'
Bundle 'Shougo/neobundle.vim.git'
Bundle 'Shougo/unite.vim.git'
Bundle 'Shougo/vimfiler.git'
Bundle 'Shougo/vimshell.git'
Bundle 'thinca/vim-qfreplace.git'
Bundle 'thinca/vim-quickrun.git'
Bundle 'tsukkee/unite-tag.git'
Bundle 'vim-scripts/delphi.vim.git'
Bundle 'vim-scripts/JSON.vim.git'
Bundle 'thinca/vim-ref.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/molokai.git'
Bundle 'tpope/vim-surround.git'
Bundle 'petdance/vim-perl.git'
Bundle 'hotchpotch/perldoc-vim.git'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'
Bundle 'vim-scripts/sudo.vim.git'
Bundle 'tpope/vim-pathogen.git'
Bundle 'gmarik/vundle.git'
Bundle 'Google-translator'
Bundle 'Markdown'
Bundle 'trinity.vim'

nmap bi   :BundleInstall<CR>
nmap ,bi  :BundleInstall!<CR>
nmap bc   :BundleClean<CR>

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on 

" タイトルをウインドウ枠に表示
set title

" ルーラーを表示
set ruler

" バックスペースキーで削除できるものを指定
" " indent  : 行頭の空白
" " eol     : 改行
" " start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" シンタックスハイライトを有効にする
syntax enable

" 検索結果文字列のハイライトを有効にする
set hlsearch

" 行番号を表示する
set number

" tabをスペースに置換
set expandtab

" タブが対応する空白の数
set tabstop=4

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" PowerLine
let g:Powerline_symbols = 'fancy' 
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

let g:neocomplcache_snippets_dir = "~/.vim/snippets"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }

" rubyのインデント制御
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)


