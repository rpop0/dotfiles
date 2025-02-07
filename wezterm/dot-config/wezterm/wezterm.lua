local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local binds = require('binds')

binds.apply_to_config(config)

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14


config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.default_prog = {'nu'}

config.window_background_opacity = 0.93

-- Removes the title bar on windows only, as this breaks on Hyprland.
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.window_decorations = 'RESIZE'
end

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000}



--- LEADER KEY STATUS ---
wezterm.on('update-right-status', function(window)
  local leader = ''
  if window:leader_is_active() then
    leader = ''
  end
  window:set_right_status(leader)
end)

config.colors = {
    compose_cursor = 'orange'
}
--- LEADER KEY STATUS ---

return config
