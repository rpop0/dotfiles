local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'FiraCode Nerd Font Mono'


config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000}

config.keys = {
    {
        key = '\\',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        key = 'c',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action.PaneSelect

    },
    {
        key = 'z',
        mods = 'LEADER',
        action = wezterm.action.TogglePaneZoomState

    },
    {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },


}

for i = 1,8 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(i - 1)
    })
end


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


return config
