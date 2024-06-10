-- colors customization

local edit_colorscheme = function()
	-- inspired by https://stackoverflow.com/questions/74677587/how-to-set-comments-to-italic-fonts-in-neovim
	local update_hl = function(group_name, opts)
		local hl_group = vim.api.nvim_get_hl(0, { name = group_name })
		hl_group = vim.tbl_extend("force", hl_group, opts)
		vim.api.nvim_set_hl(0, group_name, hl_group)
	end

	-- remove background
	update_hl("Normal", { bg = "none" })
	update_hl("EndOfBuffer", { bg = "none" })
	update_hl("LineNr", { bg = "none" })
	update_hl("CursorLine", { bg = "#1c1d23" })
	update_hl("CursorLineNr", { bg = "#1c1d23" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("colors", { clear = true }),
	pattern = "default",
	callback = edit_colorscheme,
})

vim.cmd.colorscheme("default")
