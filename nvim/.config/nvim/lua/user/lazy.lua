local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local result = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Failed to install lazy.nvim:\n" .. result)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Some distro builds keep bundled parsers outside $VIMRUNTIME. lazy.nvim
-- resets runtimepath, so explicitly retain those parser directories.
local parser_runtime_paths = {}
for _, parser in ipairs(vim.api.nvim_get_runtime_file("parser/vimdoc.so", true)) do
  parser_runtime_paths[#parser_runtime_paths + 1] = vim.fs.dirname(vim.fs.dirname(parser))
end

require("lazy").setup({
  spec = {
    "nvim-lua/plenary.nvim",

    { "windwp/nvim-autopairs" },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      lazy = false,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    "akinsho/toggleterm.nvim",
    "ahmedkhalf/project.nvim",
    "numToStr/Comment.nvim",
    "goolord/alpha-nvim",
    "folke/which-key.nvim",
    "moll/vim-bbye",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
    { "scrooloose/nerdtree", cmd = "NERDTreeToggle" },
    "scrooloose/nerdcommenter",
    "majutsushi/tagbar",
    "mg979/vim-visual-multi",

    "rafi/awesome-vim-colorschemes",
    "Mofiqul/dracula.nvim",

    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
      },
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "windwp/nvim-autopairs",
      },
    },
    "ray-x/lsp_signature.nvim",
    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    "lewis6991/gitsigns.nvim",
    { "folke/lazydev.nvim", ft = "lua" },

    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
      },
    },
    "theHamsta/nvim-dap-virtual-text",
    { "nvim-telescope/telescope-dap.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },

    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "hashivim/vim-terraform",
    "FabijanZulj/blame.nvim",
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "gruvbox", "habamax" },
  },
  checker = {
    enabled = false,
  },
  rocks = {
    enabled = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      paths = parser_runtime_paths,
    },
  },
})
