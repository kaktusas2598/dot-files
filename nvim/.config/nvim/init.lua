vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('user.remap')
require('user.options')
require('user.lazy')
require('user.lualine')

require('user.treesitter')
require('user.bufferline')
require('user.autocommands')
require('user.indentline')
require('user.nvim-tree')
require('user.lsp')
require('user.cmp')
require('user.telescope')
require('user.toggleterm')
--require('user.comment')
require('user.autopairs')
require('user.project')
require('user.alpha')
require('user.whichkey')
require('user.gitsigns')
require('user.colorscheme')
require('user.dap')

-- This works by running autocmd on all filetypes on startup
-- Use :ColorizerAttachToBuffer to start colorizer in files without filetype
--require'colorizer'.setup()
