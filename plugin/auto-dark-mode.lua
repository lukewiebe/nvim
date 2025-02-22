-- https://github.com/f-person/auto-dark-mode.nvim

require("auto-dark-mode").setup({
	set_dark_mode = function()
		vim.o.background = "dark"
		vim.cmd("silent !tmux source-file ~/.config/tmux/nvim-dark.conf")
	end,
	set_light_mode = function()
		vim.o.background = "light"
		vim.cmd("silent !tmux source-file ~/.config/tmux/nvim-light.conf")
	end,
})
