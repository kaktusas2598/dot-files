local options = {
    number = true,                           -- set numbered lines
    relativenumber = true,                  -- set relative numbered lines
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    encoding = "utf-8",
    fileencoding = "utf-8",                  -- the encoding written to a file
    fillchars = { vert = " "},
    hlsearch = true,                         -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    -- pumheight = 10,                          -- pop up menu height
    -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = false,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    tabstop = 4,                             -- insert 2 spaces for a tab
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    softtabstop = 4,
    cursorline = true,                       -- highlight the current line
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    autoindent = true,
    copyindent = true,
    smartindent = true,                      -- make indenting smarter again

    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    --colorcolumn = "120",                     -- Display column at specified length, for keeping lines short
    wrap = true,                             -- display lines as one long line
    linebreak = true,                        -- companion to wrap, don't split words
    scrolloff = 5,                           -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 5,                       -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    -- whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
    whichwrap = "",                  -- which "horizontal" keys are allowed to travel to prev/next line
    foldmethod = "syntax",

}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

