-- [nfnl] fnl/plugins/neotree.fnl
local function _1_()
  local neo_tree = require("neo-tree")
  return neo_tree.setup({window = {width = 25}, source_selector = {sources = {{source = "filesystem"}, {source = "buffers"}, {source = "git_status"}}}})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons"}, config = _1_, lazy = false}}
