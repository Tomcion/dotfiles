local opts = { noremap = true, silent = true }

local function nmap(key, action)
    vim.api.nvim_set_keymap('n', key, action, opts)
end

nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')
