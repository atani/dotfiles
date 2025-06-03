-- インサートモードとコマンドモードで ¥ を \ に変換（Mac対応）
vim.api.nvim_set_keymap("i", "<char-165>", "\\", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<char-165>", "\\", { noremap = true, silent = true })

-- システムクリップボードを使用（マウス選択でコピー＆カーソル位置復元）
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.keymap.set("x", "<LeftRelease>", "*ygv<Esc>", { noremap = true, silent = true })

-- Insertモードで Cmd+v をペーストに割り当て
vim.keymap.set("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })

-- リーダーキー設定
vim.g.mapleader = " "

-- :Sh で縦分割ターミナル起動
vim.api.nvim_create_user_command("Sh", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, {})

-- lazy.nvimのロード
local lazypath = vim.fn.stdpath("data") .. "/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- 基本設定
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "iso-2022-jp", "euc-jp", "sjis", "utf-8" }
vim.opt.title = true
vim.opt.ruler = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.list = true
vim.opt.listchars = { tab = ">\\ ", extends = "<" }
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.fileformats = { "unix", "dos", "mac" }

-- ハイライトやシンタックス
vim.cmd [[
  syntax enable
  set hlsearch
]]

-- ビュー保存・復元
vim.cmd [[
  autocmd BufWinLeave *.lua,*.go,*.rb,*.py,*.js,*.ts silent! mkview
  autocmd BufWinEnter *.lua,*.go,*.rb,*.py,*.js,*.ts silent! loadview
]]

-- Ruby用インデント設定
vim.cmd [[
  au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
  au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2
]]
