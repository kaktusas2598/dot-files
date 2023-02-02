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
    indent = { enable = true , disable = { "cpp" }}, -- Not sure why it breaks cpp indent, especially within namespaces

    nt_cpp_tools = {
        enable = true,
        preview = {
            quit = 'q', -- optional keymapping for quit preview
            accept = '<tab>' -- optional keymapping for accept preview
        },
        header_extension = 'hxx', -- optional
        source_extension = 'cxx', -- optional
        custom_define_class_function_commands = { -- optional
            TSCppImplWrite = {
                output_handle = require'nvim-treesitter.nt-cpp-tools.output_handlers'.get_add_to_cpp()
            }
            --[[
            <your impl function custom command name> = {
                output_handle = function (str, context)
                    -- string contains the class implementation
                    -- do whatever you want to do with it
                end
            }
            ]]
        }
    }
})

--local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
--parser_configs.glsl = {
    -- Set more filetypes used by shaders to enable parsing for those files
    --used_by = { "glsl", "vert", "frag", "geom", "shader" }
--}
