local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local parsers = {
  "vimdoc",
  "bash",
  "c",
  "cpp",
  "cmake",
  "glsl",
  "php",
  "json",
  "lua",
  "python",
  "go",
  "gomod",
  "gosum",
  "gotmpl",
  "javascript",
  "typescript",
  "tsx",
  "jsdoc",
  "html",
  "css",
  "hcl",
  "yaml",
  "markdown",
  "markdown_inline",
}

treesitter.setup({})
vim.treesitter.language.register("json", "jsonc")

local parser_set = {}
for _, parser in ipairs(parsers) do
  parser_set[parser] = true
end

local function install_parsers()
  if vim.fn.executable("tree-sitter") == 1 then
    treesitter.install(parsers)
  end
end

install_parsers()

-- On a fresh install Mason may finish installing tree-sitter-cli after this
-- module loads. Install the parsers as soon as that tool becomes available.
vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsUpdateCompleted",
  callback = install_parsers,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local language = vim.treesitter.language.get_lang(args.match) or args.match
    if not parser_set[language] then
      return
    end

    pcall(vim.treesitter.start, args.buf, language)
    if language ~= "cpp" then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
