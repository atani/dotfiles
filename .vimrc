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
syntax on
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

" QFixMemo
"----------------------------------------
" ランタイムパスはNeoBundleで設定済み
" set runtimepath+=
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
" 新規メモ用のテンプレート
let qfixmemo_template = [
  \'%TITLE%  %TAG%',
    \""
  \]
" MRUの基準ディレクトリ
let QFixMRU_RootDir = qfixmemo_dir
" MRUファイルのパス
let QFixMRU_Filename = qfixmemo_dir . '/.qfixmru'
" qfixmemo-chenv.vimの基準ディレクトリ
let qfixmemo_chdir = qfixmemo_dir
" 切り替え用のkeybind
function! QFixMemoKeymapPost()
  nnoremap <silent> <leader>hh :echo qfixmemo_dir<CR>
  "nnoremap <silent> <leader>ha :call QFixMemoChEnv('', 'time', '=')<CR>
  nnoremap <silent> <leader>hm :call QFixMemoChEnv('main', 'time', '=')<CR>
  "nnoremap <silent> <leader>hb :call QFixMemoChEnv('blog', 'none', '*')<CR>
  "nnoremap <silent> <leader>hw :call QFixMemoChEnv('wiki', 'none', '=')<CR>
endfunction

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
NeoBundle 'https://github.com/Lokaltog/vim-powerline'

filetype plugin on
filetype indent on

