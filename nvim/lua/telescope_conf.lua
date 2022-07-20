local map = require'utils.key_mappings'

require'telescope'.setup {
    defaults = {
        file_ignore_patterns = { 'node_modules' }
    }
}

map.n('<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
-- map.n('<leader>fg', '<cmd>Telescope live_grep<cr>')
-- map.n('<leader>fb', '<cmd>Telescope buffers<cr>')
-- map.n('<leader>fh', '<cmd>Telescope help_tags<cr>')
