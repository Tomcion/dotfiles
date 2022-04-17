local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    print 'failed to load lsp-instaler'
	return
end

local function set_keymaps(buffnr)
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

local function make_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not status_ok then
        print 'failed to load cmp_nvim_lsp'
        return
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_updated_capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    return cmp_updated_capabilities
end

local function on_attach(_, buffnr)
    set_keymaps(buffnr)
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = make_capabilities()
    }

    if server.name == 'sumneko_lua' then
        local sumneko_opts = require 'lsp.settings.sumneko_lua'
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    server:setup(opts)
end)
