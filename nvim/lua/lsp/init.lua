require "lsp.diagnostic"

local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- setting up nvim-lsp-installer
lsp_installer.setup {}

local function make_capabilities()
    local status_ok_2, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not status_ok_2 then
        print 'failed to load cmp_nvim_lsp'
        return
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_updated_capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

    return cmp_updated_capabilities
end

-- Getting a list of installed servers from nvim-lsp-installer
local servers = lsp_installer.get_installed_servers()

for _, server in ipairs(servers) do
    -- The folder where all of the server-specific additional configs are stored
    local settings_path = "lsp.settings." .. server.name
    local add_opts_exist, add_opts = pcall(require, settings_path)

    -- Default options for every server
    local opts = {
        on_attach = require("lsp.keymaps").set_keymaps,
        capabilities = make_capabilities(),
    }

    -- If additional settings exist, they will be merged with the default ones
    if (add_opts_exist) then
        opts = vim.tbl_deep_extend('keep', add_opts, opts)
    end

    -- Setting up the server
    lspconfig[server.name].setup(opts)
end
