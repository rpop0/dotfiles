local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
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
    for i = 1, 8 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'LEADER',
            action = wezterm.action.ActivateTab(i - 1)
        })
    end
end

return module
