vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

local ts = require('nvim-treesitter')

-- State tracking for async parser loading
local parsers_loaded = {}
local parsers_pending = {}
local parsers_failed = {}

local ns = vim.api.nvim_create_namespace('treesitter.async')

-- Helper to start highlighting and indentation
local function start(buf, lang)
    local ok = pcall(vim.treesitter.start, buf, lang)
    if ok then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
    return ok
end

-- Install core parsers after lazy.nvim finishes loading all plugins
vim.api.nvim_create_autocmd('User', {
    once = true,
    callback = function()
        ts.install({
            'bash',
            'comment',
            'diff',
            'fish',
            'git_config',
            'git_rebase',
            'gitcommit',
            'gitignore',
            'json',
            'lua',
            'markdown',
            'markdown_inline',
            'python',
            'regex',
            'toml',
            'vim',
            'vimdoc',
            'xml',
        }, {
            max_jobs = 8,
        })
    end,
})

-- Decoration provider for async parser loading
vim.api.nvim_set_decoration_provider(ns, {
    on_start = vim.schedule_wrap(function()
        if #parsers_pending == 0 then
            return false
        end
        for _, data in ipairs(parsers_pending) do
            if vim.api.nvim_buf_is_valid(data.buf) then
                if start(data.buf, data.lang) then
                    parsers_loaded[data.lang] = true
                else
                    parsers_failed[data.lang] = true
                end
            end
        end
        parsers_pending = {}
    end),
})

local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

-- Auto-install parsers and enable highlighting on FileType
vim.api.nvim_create_autocmd('FileType', {
    group = group,
    desc = 'Enable treesitter highlighting and indentation (non-blocking)',
    callback = function(event)

        local parsers = require('nvim-treesitter.parsers')
        local lang = vim.treesitter.language.get_lang(event.match) or event.match

        if not lang or not parsers[lang] then
            return
        end

        local buf = event.buf

        if parsers_failed[lang] then
            return
        end

        if parsers_loaded[lang] then
            -- Parser already loaded, start immediately (fast path)
            start(buf, lang)
        else
            -- Queue for async loading
            table.insert(parsers_pending, { buf = buf, lang = lang })
        end

        -- Auto-install missing parsers (async, no-op if already installed)
        ts.install({ lang })
    end,
})
