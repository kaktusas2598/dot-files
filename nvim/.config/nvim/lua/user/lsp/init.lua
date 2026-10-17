require "user.lsp.mason"
require("user.lsp.handlers").setup()

-- For auto completing function signatures as you type
local cfg = {}
require "lsp_signature".setup(cfg)
