-- colors customization

local edit_colorscheme = function()
	local update_hl = require("update_hl")

	-- remove background
	update_hl("Normal", { bg = "none" })
	update_hl("EndOfBuffer", { bg = "none" })
	update_hl("LineNr", { bg = "none" })

	-- change cursorline color depending on mode
	if vim.o.background == "dark" then
		update_hl("CursorLine", { bg = "#1c1d23" })
		update_hl("CursorLineNr", { bg = "#1c1d23" })
	else
		update_hl("CursorLine", { bg = "#ebeef5" })
		update_hl("CursorLineNr", { bg = "#ebeef5" })
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("colors", { clear = true }),
	pattern = "default",
	callback = edit_colorscheme,
})

vim.cmd.colorscheme("default") -- this runs the autocmd created above
