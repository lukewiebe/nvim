-- file quick-switcher
vim.keymap.set("n", "<space>sf", require("telescope.builtin").find_files, {})
-- quicksearch inside files
vim.keymap.set("n", "<space>sg", require("telescope.builtin").live_grep, {})
-- buffer search
vim.keymap.set("n", "<space>sb", require("telescope.builtin").buffers, {})
-- help search
vim.keymap.set("n", "<space>sh", require("telescope.builtin").help_tags, {})

require("telescope").setup({
	defaults = {
		-- default settings go here
	},

	pickers = {
		-- picker-specific settings go here
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		help_tags = {
			theme = "dropdown",
		},
	},

	extensions = {
		-- extension configurations go here
		fzf = {
			-- copied from https://github.com/nvim-telescope/telescope-fzf-native.nvim
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
