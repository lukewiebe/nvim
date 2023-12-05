--  COLORS --
vim.o.termguicolors = true

vim.cmd.colorscheme("spaceduck")

local update_highlight = require("update_highlight")

update_highlight("Comment", { italic = true })
update_highlight("Normal", { bg = "none" })
update_highlight("EndOfBuffer", { bg = "none" })
update_highlight("LineNr", { bg = "none" })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", fg = "#30365F" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#30365F" })
