-- [nfnl] fnl/config/init.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
vim.wo.wrap = true
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", ruler = true, signcolumn = "yes:1", exrc = true, number = false}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
vim.g.clojure_align_subforms = 1
return {}
