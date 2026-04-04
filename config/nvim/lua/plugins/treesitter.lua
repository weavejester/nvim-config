-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local treesitter = require("nvim-treesitter")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "clojure", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "lua", "markdown", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", config = _1_, lazy = false}}
