require 'options'
require 'plugins'
require 'mappings'
require 'colors'
require 'lsp'

require 'cmp_config'
require 'treesitter_conf'
require 'lualine_conf'
require 'telescope_conf'

local map = require 'utils.key_mappings'
map.n("<C-n>", ":NERDTreeToggle<cr>")
map.n("<leader>n", ":NERDTreeFocus<cr>")

