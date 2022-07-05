local everblush = require("everblush")
local colors = {}
local hi = vim.highlight.create

colors.setup = function()
  everblush.setup({ nvim_tree = { contrast = true } })

  -- everblush theme does not include many highlight groups
  hi("PMenu",  {guibg = "#181f21", guifg = "#dadada"})
end

return colors
