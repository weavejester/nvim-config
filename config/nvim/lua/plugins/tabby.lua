-- [nfnl] fnl/plugins/tabby.fnl
local function _1_()
  local tabby = require("tabby")
  return tabby.setup({})
end
return {{"nanozuki/tabby.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_}}
