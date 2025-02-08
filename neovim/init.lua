-- インサートモードとコマンドモードで ¥ を \ に変換（Mac対応）
vim.api.nvim_set_keymap("i", "<char-165>", "\\", { noremap = true, silent = true })
vim.api.nvim_set_keymap("c", "<char-165>", "\\", { noremap = true, silent = true })

-- システムクリップボードを使用
-- vim.opt.clipboard = "unnamedplus"
vim.keymap.set("x", "<LeftRelease>", '"+y', { noremap = true, silent = true })

-- マウス有効化
vim.opt.mouse = "a"

-- マウスで選択した瞬間にコピー＆選択前のカーソル位置に戻る
vim.keymap.set("x", "<LeftRelease>", "*ygv<Esc>", { noremap = true, silent = true })

-- Insertモードで Cmd+v(⌘+v) をペーストに割り当て
vim.keymap.set("i", "<D-v>", '<Esc>"+pa', { noremap = true, silent = true })

vim.g.mapleader = " "  -- スペースキーをリーダーに設定
vim.api.nvim_create_user_command("Sh", function()  
  vim.cmd("vsplit")        -- まず縦分割
  vim.cmd("wincmd l")      -- 右側のウィンドウにフォーカスを移動
  vim.cmd("terminal")      -- ターミナルを開く
  vim.cmd("startinsert")   -- 自動で挿入モードにする
end, {}) -- 縦分割でターミナルを開く

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
