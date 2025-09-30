-- [nfnl] fnl/plugins/neogit.fnl
local function _1_()
  local neogit = require("neogit")
  return neogit.open()
end
return {{"NeogitOrg/neogit", dependencies = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"}, keys = {{"<leader>gg", _1_, desc = "Open Neogit"}}, opts = {graph_style = "unicode", kind = "floating"}}}
