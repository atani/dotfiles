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
" syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch

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

" QFixMemo
"----------------------------------------
" ランタイムパスはNeoBundleで設定済み
" set runtimepath+=
"Howmコマンドキーマップ
let QFixHowm_Key = 'g'
" QFixHowm互換を切る
let QFixHowm_Convert = 0
" デフォルトの保存先
let qfixmemo_dir = $HOME . '/Documents/qfixhowm'
" デフォルトのファイル名命名規則
let qfixmemo_filename = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
" メモのエンコーディング
let qfixmemo_fileencoding = 'utf-8'
" メモの改行コード
let qfixmemo_fileformat = 'unix'
" メモのファイルタイプは自動判別
let qfixmemo_filetype = ''
" MRUの基準ディレクトリ
let QFixMRU_RootDir = qfixmemo_dir
" MRUファイルのパス
let QFixMRU_Filename = qfixmemo_dir . '/.qfixmru'
" qfixmemo-chenv.vimの基準ディレクトリ
let qfixmemo_chdir = qfixmemo_dir
" 新規エントリーのテンプレート
let QFixHowm_Template = [
  \"= %TAG%",
  \""
\]
" 切り替え用のkeybind
function! QFixMemoKeymapPost()
  nnoremap <silent> <leader>hh :echo qfixmemo_dir<CR>
  "nnoremap <silent> <leader>ha :call QFixMemoChEnv('', 'time', '=')<CR>
  nnoremap <silent> <leader>hm :call QFixMemoChEnv('main', 'time', '=')<CR>
  "nnoremap <silent> <leader>hb :call QFixMemoChEnv('blog', 'none', '*')<CR>
  "nnoremap <silent> <leader>hw :call QFixMemoChEnv('wiki', 'none', '=')<CR>
endfunction

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
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

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)


""" twitvim
let twitvim_count = 40
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>

""" smartchr
inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')

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
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
"NeoBundle 'https://github.com/Shougo/vimproc.git'
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
NeoBundle 'https://github.com/Lokaltog/vim-powerline'
NeoBundle 'https://github.com/fuenor/qfixhowm.git'
NeoBundle 'https://github.com/vim-scripts/molokai.git'
NeoBundle 'https://github.com/tpope/vim-surround.git'
NeoBundle 'https://github.com/petdance/vim-perl.git'
NeoBundle 'https://github.com/hotchpotch/perldoc-vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'https://github.com/fuenor/qfixgrep.git'
NeoBundle 'https://github.com/vim-scripts/sudo.vim.git'
NeoBundle 'https://github.com/tpope/vim-pathogen.git'
NeoBundle 'https://github.com/gmarik/vundle.git'

filetype plugin on
filetype indent on

