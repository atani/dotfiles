local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.keys = {
  -- Cmd + d で左右分割（垂直分割）
  { key = "d", mods = "CMD", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  -- Cmd + Shift + d で上下分割（水平分割）
  { key = "d", mods = "CMD|SHIFT", action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  -- Cmd + → で右のタブへ移動
  { key = "RightArrow", mods = "CMD", action = wezterm.action { ActivateTabRelative = 1 } },
  -- Cmd + ← で左のタブへ移動
  { key = "LeftArrow", mods = "CMD", action = wezterm.action { ActivateTabRelative = -1 } },
  -- Cmd + { で左のペインに移動（循環あり）
  { key = "[", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Left" } },
  -- Cmd + } で右のペインに移動（循環あり）
  { key = "]", mods = "CMD", action = wezterm.action { ActivatePaneDirection = "Right" } },
  -- ¥ を \ にマッピング
  { key = "¥", mods = "", action = wezterm.action.SendKey { key = "\\" } },
}

-- フォントサイズを 14.0 に設定
config.font_size = 14.0

config.font = wezterm.font_with_fallback {
  "JetBrains Mono",        -- 英字・記号に強い
  "Noto Sans Mono CJK JP"  -- 日本語対応（等幅）
}

-- スクロールバッファ
scrollback_lines = 100000

return config
