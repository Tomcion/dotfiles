require("nvim-tree").setup({
    hijack_cursor = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        -- mappings = {
        --     list = {
        --         { key = "u", action = "dir_up" },
        --     },
        -- },
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = false
            },
        },
    },
    filters = {
        dotfiles = true,
    },
})

local map = require'utils.key_mappings'

map.n('<C-n>', ':NvimTreeToggle<CR>')
map.n('<leader>n', ':NvimTreeFocus<CR>')
