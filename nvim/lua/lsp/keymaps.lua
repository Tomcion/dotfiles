local M = {}

M.set_keymaps = function(_, buffnr)
    local opts = { noremap = true, silent = true }
    local function nmap(key, action)
        vim.api.nvim_buf_set_keymap(buffnr, 'n', key, action, opts)
    end

    nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
--     nmap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    nmap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    nmap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    nmap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    nmap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
--     nmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    nmap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

    -- Diagnostics
    nmap('<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
    nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    nmap('<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')
end

return M
