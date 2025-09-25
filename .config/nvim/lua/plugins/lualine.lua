-- [nfnl] fnl/plugins/lualine.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lsp = autoload("config.lsp")
local function _2_()
  local lualine = require("lualine")
  return lualine.setup({})
end
return {{"nvim-lualine/lualine.nvim", config = _2_}}
