local opts = { noremap = true, silent = true }

local function nmap(key, action)
    vim.api.nvim_set_keymap('n', key, action, opts)
end

local function imap(key, action)
    vim.api.nvim_set_keymap('i', key, action, opts)
end

local function vmap(key, action)
    vim.api.nvim_set_keymap('v', key, action, opts)
end

local function tmap(key, action)
    vim.api.nvim_set_keymap('t', key, action, opts)
end

local M = {
    n = nmap,
    v = vmap,
    t = tmap,
    i = imap
}

return M
