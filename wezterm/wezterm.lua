local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 字体设置
config.font = wezterm.font 'MesloLGS NF'
config.font_size = 12.0

-- 颜色主题
config.color_scheme = "Catppuccin Mocha"


-- 启用连字
config.harfbuzz_features = {"calt=0", "clig=0", "liga=1"}

-- 设置键绑定
config.keys = {
  -- 新建标签页
  {key="t", mods="CTRL", action=wezterm.action{SpawnTab="DefaultDomain"}},
  -- 关闭标签页
  {key="w", mods="CTRL", action=wezterm.action{CloseCurrentTab={confirm=true}}},
}

return config

