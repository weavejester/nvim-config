-- [nfnl] fnl/plugins/telescope.fnl
local function set_leader_keymap(k, f, desc)
  return vim.keymap.set("n", ("<leader>" .. k), f, {desc = desc})
end
local function _1_()
  local builtin = require("telescope.builtin")
  set_leader_keymap("ff", builtin.find_files, "Telescope find files")
  set_leader_keymap("fg", builtin.live_grep, "Telescope live grep")
  set_leader_keymap("fb", builtin.buffers, "Telescope buffers")
  return set_leader_keymap("fh", builtin.help_tags, "Telescope help tags")
end
local function _2_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, init = _1_, config = _2_}}
