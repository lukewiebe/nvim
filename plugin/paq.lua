-- https://github.com/savq/paq-nvim

require("paq")({
	"https://github.com/savq/paq-nvim",

	-- editor (sanity) modifications
	"https://github.com/windwp/nvim-autopairs", -- sensible bracket autoclose behaviour
	"https://tpope.io/vim/abolish.git", -- Subvert and siblings
	"https://tpope.io/vim/sleuth.git", -- match editor settings to file
	"https://tpope.io/vim/surround.git", -- needs no introduction
	"https://tpope.io/vim/repeat.git", -- dot repeat for tpope stuff
	"https://tpope.io/vim/fugitive.git", -- git client
	"https://github.com/stevearc/oil.nvim", -- replace netrw with a better pane file explorer
	"https://github.com/andymass/vim-matchup", -- better % jumps
	"https://github.com/numToStr/Comment.nvim", -- gc operator for comments
	"https://github.com/chrishrb/gx.nvim",

	"https://github.com/pineapplegiant/spaceduck", -- my forever colorscheme

	-- telescope
	"https://github.com/nvim-lua/plenary.nvim", -- required for telescope
	{ "https://github.com/nvim-telescope/telescope.nvim", branch = "0.1.x" },

	-- fzf-native suggested install, from https://github.com/nvim-telescope/telescope-fzf-native.nvim
	{ "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- tree-sitter
	{ "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter-refactor",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",

	-- IDE features
	"https://github.com/neovim/nvim-lspconfig", -- sensible default LSP configs
	"https://github.com/stevearc/conform.nvim", -- formatter

	-- Language/project specific
	"https://github.com/mfussenegger/nvim-jdtls", -- really good Java LSP integration

	-- trial
	"https://github.com/stevearc/dressing.nvim", -- simple UI improvement
	"https://github.com/tpope/vim-rhubarb", -- github addition to fugitive
	"https://github.com/dcampos/nvim-snippy", -- minimal snippet plugin
	"https://github.com/NvChad/nvim-colorizer.lua", -- show tailwind colors inline
	"https://github.com/folke/todo-comments.nvim",
})
