-- PLUGINS --

require 'paq' {
  'https://github.com/savq/paq-nvim',

  -- editor (sanity) modifications
  'https://github.com/windwp/nvim-autopairs', -- sensible bracket autoclose behaviour
  'https://tpope.io/vim/abolish.git', -- Subvert and siblings
  'https://tpope.io/vim/sleuth.git', -- match editor settings to file
  'https://tpope.io/vim/surround.git', -- needs no introduction
  'https://tpope.io/vim/repeat.git', -- dot repeat for tpope stuff
  'https://tpope.io/vim/fugitive.git', -- git client
  'https://github.com/stevearc/oil.nvim', -- replace netrw with a better pane file explorer
  'https://github.com/andymass/vim-matchup', -- better % jumps
  'https://github.com/numToStr/Comment.nvim', -- gc operator for comments
  'https://github.com/josa42/nvim-gx',

  -- colorschemes
  'https://github.com/pineapplegiant/spaceduck', -- my forever colorscheme

  -- telescope
  'https://github.com/nvim-lua/plenary.nvim', -- required for telescope
  { 'https://github.com/nvim-telescope/telescope.nvim', branch = '0.1.x' },

  -- fzf-native suggested install, from https://github.com/nvim-telescope/telescope-fzf-native.nvim
  { 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

  -- IDE features
  'https://github.com/neovim/nvim-lspconfig', -- sensible default LSP configs
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  -- Language/project specific
  { 'https://github.com/mfussenegger/nvim-jdtls', opt = true }, -- really good Java LSP integration
  { 'https://github.com/jalvesaq/Nvim-R', opt = true },

  -- trial
  'https://github.com/stevearc/overseer.nvim',
}
