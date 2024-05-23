-- Tree-Sitter Configuration --

-- Set those options
vim.o.foldmethod = "expr" -- overrides 'syntax' in init.lua
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Borrowed formatting from:
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		-- optimizations can be applied here if needed
	},
	indent = {
		enable = true,
	},

	-- Copied from https://github.com/andymass/vim-matchup#tree-sitter-integration
	matchup = {
		enable = true,
		disable = {},
		include_matched_words = true,
	},

	-- Config for https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		-- Copied selectively from https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-select
		select = {
			enable = true,
			lookahead = true, -- jump forward to next object, like ci)
			include_surrounding_whitespace = false, -- function like 'ap' when on
			keymaps = {
				["if"] = "@function.inner",
				["af"] = "@function.outer",
				["ic"] = "@class.inner",
				["ac"] = "@class.outer",
			},

			selection_modes = {
				-- default is 'v'
				["@function.outer"] = "V",
				["@class.outer"] = "V",
			},
		},

		-- from https://github.com/nvim-treesitter/nvim-treesitter-textobjects#text-objects-move
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
			},
		},
	},

	-- from https://github.com/nvim-treesitter/nvim-treesitter-refactor
	refactor = {
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>s", -- overridden by autocmd on LSP attach
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition_lsp_fallback = "gd",
				list_definitions_toc = "gO",
			},
		},
	},
})
