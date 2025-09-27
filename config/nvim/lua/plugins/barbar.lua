-- [nfnl] fnl/plugins/barbar.fnl
local function _1_()
  vim.g.barbar_auto_setup = false
  return nil
end
local function _2_()
  local barbar = require("barbar")
  return barbar.setup({auto_hide = true})
end
return {{"romgrk/barbar.nvim", dependencies = {"lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons"}, init = _1_, config = _2_}}
