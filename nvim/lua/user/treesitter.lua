local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
    ensure_installed = {
        "help",
        "bash",
        "c",
        "cpp",
        "cmake",
        "glsl",
        "php",
        "json",
        "lua",
        "python",
        "hcl",
        --"css",
        --"go",
        --"rust",
        "yaml",
        "markdown",
        "markdown_inline"
    }, -- one of "all" or a list of languages
    sync_install = false,
    auto_install = true,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true },
})

--local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
--parser_configs.glsl = {
    -- Set more filetypes used by shaders to enable parsing for those files
    --used_by = { "glsl", "vert", "frag", "geom", "shader" }
--}
