--  COLORS --
vim.o.termguicolors = true

vim.cmd.colorscheme("spaceduck")

-- borrowed from https://stackoverflow.com/questions/74677587/how-to-set-comments-to-italic-fonts-in-neovim
local update_highlight = function(group_name, opts)
	local hl_group = vim.api.nvim_get_hl(0, { name = group_name })
	hl_group = vim.tbl_extend("force", hl_group, opts)
	vim.api.nvim_set_hl(0, group_name, hl_group)
end

update_highlight("Comment", { italic = true })
update_highlight("Normal", { bg = "none" })
update_highlight("EndOfBuffer", { bg = "none" })
update_highlight("LineNr", { bg = "none" })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", fg = "#30365F" })
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#30365F" })
