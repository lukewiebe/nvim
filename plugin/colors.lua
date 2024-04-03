--  COLORS
vim.o.termguicolors = true

local edit_colorscheme = function()
	local update_hl = require("highlights").update_hl
	update_hl("Comment", { italic = true })
	-- remove backgrounds from most things
	update_hl("Normal", { bg = "none" })
	update_hl("EndOfBuffer", { bg = "none" })
	update_hl("LineNr", { bg = "none" })
	update_hl("CursorLine", { bg = "none" })
	update_hl("CursorLineNr", { bg = "none" })
	-- status bar and window trim
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#b3a1e6", bg = "#0f111b" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#686f9a", bg = "#0f111b" })
	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#0f111b", bg = "#0f111b" })
end

-- autocmd fires when spaceduck is activated
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("EditColorScheme", { clear = true }),
	pattern = "spaceduck",
	callback = edit_colorscheme,
})

-- now activate the colorscheme
vim.cmd.colorscheme("spaceduck")
