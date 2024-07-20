-- https://github.com/f-person/auto-dark-mode.nvim

require("auto-dark-mode").setup({
	set_dark_mode = function()
		vim.o.background = "dark"
		vim.cmd("silent !tmux source-file ~/.config/tmux/nvim-dark.conf")
		require("update_hl")("CursorLine", { bg = "#1c1d23" })
		require("update_hl")("CursorLineNr", { bg = "#1c1d23" })
	end,
	set_light_mode = function()
		vim.o.background = "light"
		vim.cmd("silent !tmux source-file ~/.config/tmux/nvim-light.conf")
		require("update_hl")("CursorLine", { bg = "#ebeef5" })
		require("update_hl")("CursorLineNr", { bg = "#ebeef5" })
	end,
})
