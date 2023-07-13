--  PLUGINS --

require('packer').startup(function(use)
  use 'https://github.com/wbthomason/packer.nvim'

  -- editor (sanity) modifications
  use 'https://github.com/cohama/lexima.vim' -- sensible bracket autoclose behaviour
  use 'https://tpope.io/vim/abolish.git' -- Subvert and siblings
  use 'https://tpope.io/vim/sleuth.git' -- match editor settings to file
  use 'https://tpope.io/vim/surround.git' -- needs no introduction
  use 'https://tpope.io/vim/repeat.git' -- dot repeat for tpope stuff
  use 'https://tpope.io/vim/commentary.git' -- comment out stuff
  use 'https://tpope.io/vim/fugitive.git' -- git client
  use 'https://github.com/tpope/vim-vinegar.git' -- make netrw awesome
  use 'https://github.com/andymass/vim-matchup' -- better % jumps

  -- colorschemes
  use 'https://github.com/pineapplegiant/spaceduck'
  use 'https://github.com/rakr/vim-one'
  use 'https://github.com/sainnhe/edge'

  -- telescope
  use {
    'https://github.com/nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'https://github.com/nvim-lua/plenary.nvim'} },
  }
  -- fzf-native suggested install, from https://github.com/nvim-telescope/telescope-fzf-native.nvim
  -- fzf-native extension requires `brew install cmake` in order to work.
  -- I had to rebuild the plugin by navigating to the source directory and rerunning the build command.
  -- source directory found using: :PackerStatus
  -- build command copied from below
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- IDE features
  use 'https://github.com/neovim/nvim-lspconfig' -- sensible default LSP configs
  use 'https://github.com/mfussenegger/nvim-jdtls' -- really good Java LSP integration
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

end)
