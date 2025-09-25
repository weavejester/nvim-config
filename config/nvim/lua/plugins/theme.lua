-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  local theme = require("monokai-nightasty")
  theme.setup({})
  return theme.load()
end
return {{"polirritmico/monokai-nightasty.nvim", priority = 1000, config = _1_, lazy = false}}
