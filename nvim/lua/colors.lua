local dark_theme = "tender"
local light_theme = "PaperColor"

vim.cmd("colorscheme " .. dark_theme)
vim.opt.background = "dark"

local opts = { noremap = true }
local map = vim.api.nvim_set_keymap

function ToggleTheme()
    if vim.o.background == 'dark' then
        vim.cmd("colorscheme " .. light_theme)
        vim.opt.background = "light"
    else
        vim.cmd("colorscheme " .. dark_theme)
        vim.opt.background = "dark"
    end
end

map("n", "<leader>th", ":lua ToggleTheme()<cr>", opts)

local background_on = true

function ToggleBackground()
    if background_on then
        vim.cmd [[
            highlight Normal ctermbg=NONE guibg=NONE
            highlight Terminal ctermbg=NONE guibg=NONE
            highlight SignColumn ctermbg=NONE guibg=NONE
            highlight LineNr ctermbg=NONE guibg=NONE
        ]]
        background_on = false
    else
        vim.opt.background = "dark"
        background_on = true
    end
end

map("n", "<leader>bg", ":lua ToggleBackground()<cr>", opts)

