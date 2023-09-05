-- PLUGINS --

require 'paq' {
  'https://github.com/savq/paq-nvim',

  -- editor (sanity) modifications
  'https://github.com/cohama/lexima.vim', -- sensible bracket autoclose behaviour
  'https://tpope.io/vim/abolish.git', -- Subvert and siblings
  'https://tpope.io/vim/sleuth.git', -- match editor settings to file
  'https://tpope.io/vim/surround.git', -- needs no introduction
  'https://tpope.io/vim/repeat.git', -- dot repeat for tpope stuff
  'https://tpope.io/vim/commentary.git', -- add `gc` operator for comments
  'https://tpope.io/vim/fugitive.git', -- git client
  'https://github.com/tpope/vim-vinegar.git', -- make netrw awesome
  'https://github.com/andymass/vim-matchup', -- better % jumps
  'https://github.com/numToStr/Comment.nvim',

  -- colorschemes
  'https://github.com/pineapplegiant/spaceduck',

  -- telescope
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  -- fzf-native suggested install, from https://github.com/nvim-telescope/telescope-fzf-native.nvim
  -- fzf-native extension requires `brew install cmake` in order to work.
  -- I had to rebuild the plugin by navigating to the source directory and rerunning the build command.
  -- source directory found using: :PackerStatus
  -- build command copied from below
  {
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  -- IDE features
  'https://github.com/neovim/nvim-lspconfig', -- sensible default LSP configs
  'https://github.com/mfussenegger/nvim-jdtls', -- really good Java LSP integration
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
}
