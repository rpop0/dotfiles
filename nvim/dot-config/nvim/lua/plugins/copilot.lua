return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    -- Only enable on work laptop.
    cond = function ()
        if vim.loop.os_gethostname() ~= "C-5CG2124ZCY" then
            return false;
        end
        return true;
    end,
    config = function ()
        require('copilot').setup({
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = '<M-.>',
                    next = '<M-]>',
                    prev = '<M-[>',
                }

            }
        })
    end

}
