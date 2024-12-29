-- https://github.com/nvim-telescope/telescope.nvim

require("telescope").setup({
	pickers = {
		find_files = { theme = "dropdown" },
		live_grep = { theme = "dropdown" },
		buffers = { theme = "dropdown" },
		help_tags = { theme = "dropdown" },
	},
})

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<space>sf", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<space>sg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<space>sb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<space>sh", require("telescope.builtin").help_tags, {})
vim.keymap.set("n", "<space>sp", require("telescope.builtin").resume, {})
