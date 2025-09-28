-- [nfnl] fnl/plugins/telescope.fnl
local builtin = require("telescope.builtin")
local function _1_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, keys = {{"<leader>ff", builtin.find_files, desc = "Telescope find files"}, {"<leader>fg", builtin.life_grep, desc = "Telescope life grep"}, {"<leader>fb", builtin.buffers, desc = "Telescope buffers"}, {"<leader>fh", builtin.help_tags, desc = "Telescope help tags"}}, config = _1_}}
