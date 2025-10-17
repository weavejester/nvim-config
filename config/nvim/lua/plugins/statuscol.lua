-- [nfnl] fnl/plugins/statuscol.fnl
local function _1_()
  local statuscol = require("statuscol")
  return statuscol.setup({segments = {{click = "v:lua.ScSa", sign = {name = {".*"}, text = {".*"}, maxwidth = 1, colwidth = 1}}}})
end
return {{"luukvbaal/statuscol.nvim", config = _1_}}
