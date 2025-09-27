-- [nfnl] fnl/plugins/which-key.fnl
local function _1_()
  return require("which-key")[show({global = false})]
end
return {{"folke/which-key.nvim", event = "VeryLazy", opts = {}, keys = {{"<leader>?", _1_, desc = "Buffer Local Keymaps (which-key)"}}}}
