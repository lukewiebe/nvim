--  COLORS
vim.o.termguicolors = true

vim.cmd.colorscheme("spaceduck")

local update_highlight = require("update_highlight")

update_highlight("Comment", { italic = true })

-- remove backgrounds from most things
update_highlight("Normal", { bg = "none" })
update_highlight("EndOfBuffer", { bg = "none" })
update_highlight("LineNr", { bg = "none" })
update_highlight("CursorLineNr", { bg = "none" })
update_highlight("CursorLine", { bg = "none" })

-- status bar and window trim
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#b3a1e6", bg = "#0f111b" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#686f9a", bg = "#0f111b" })
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#0f111b", bg = "#0f111b" })
