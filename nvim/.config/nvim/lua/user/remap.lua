local opts = {silent = true}
local keymap = vim.keymap.set
vim.g.mapleader = ","

--local keymap = vim.api.nvim_set_keymap

keymap("n", ";", ":")
keymap("n", ",/", ":nohlsearch<CR>", opts)

-- Move selected text up/down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--After pasting yanked text in selection mode, keep it in yank register
--keymap("x", "<leader>p", "\"_dP")

-- Yank into system's clipboard
keymap("n", "<leader>y", "\"+y")
keymap("v", "<leader>y", "\"+y")

-- Refactor word under cursor in a buffer
keymap("n", "<leader>rf", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Buffer keymap
keymap("n", "<leader>bn", ":bnext<CR>")
keymap("n", "<leader>bp", ":bprev<CR>")
keymap("n", "<leader>bd", ":bd<CR>")

-- Half page jumps and keep cursor in the middle
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-y>", "<C-d>zz")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<C-e>", ":NvimTreeToggle<CR>")
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap("n", "<C-n>", ":NvimTreeToggle<CR>")
keymap("n", "<leader>n", ":NvimTreeToggle<CR>")
-- NERDTree and Tagbar remaps
--keymap("n", "<C-n>", ":NERDTreeToggle<CR>")
--keymap("n", "<leader>n", ":NERDTreeToggle<CR>")
keymap("n", "<C-t>", ":TagbarToggle<CR>")
keymap("n", "<leader>t", ":TagbarToggle<CR>")

-- Telescope keybinds for quick fuzzy search
--local builtin = require('telescope.builtin')
--keymap('n', '<leader>ff', builtin.find_files, {})
--keymap('n', '<leader>fg', builtin.live_grep, {})
--keymap('n', '<leader>fb', builtin.buffers, {})
--keymap('n', '<leader>fh', builtin.help_tags, {})

-- Toggle checkbox, maybe should only be enabled for certain filetypes like conf and markdown
keymap("n", "<leader>m", ":lua require('toggle-checkbox').toggle()<CR>")
