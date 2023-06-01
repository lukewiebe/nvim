-- SETTINGS
vim.o.smarttab = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.mouse = '' -- disable mouse, hahaha
vim.o.undofile = true
vim.o.splitright = true -- new vertical splits show up on the right side
vim.o.splitbelow = true -- new horizonal splits appear on the bottom
vim.o.scrolloff = 5 -- show context, matches defaults.vim
vim.cmd([[tnoremap <Esc> <C-\><C-n>]]) -- let esc exit insert mode in terminal buffer
vim.o.foldmethod = "syntax"
vim.o.foldlevel = 99 -- don't fold by default
vim.o.laststatus = 1 -- Remove the statusline if there's only one window

-- on trial
vim.o.autochdir = 1

-- Tabs
-- overridden by vim-sleuth in some cases
vim.o.tabstop = 2
vim.o.softtabstop = -1 -- when negative, value of tabstop is used
vim.o.shiftwidth = 0 -- when zero, value of tabstop is used

--  COLORS --
vim.cmd.colorscheme("spaceduck")
-- tweak some color choices
-- nvim_set_hl() wipes out the color group, so I need to rebuild the parts I want to keep manually
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "none", ctermfg = 237 })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "none", ctermfg = 237 })

-- NEOVIDE --

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h13"
  vim.g.neovide_transparency = 0.0
  vim.g.neovide_background_color = 'FFFFFF'
  vim.cmd.colorscheme('delek') -- light mode
end

--  PLUGINS --

require('packer').startup(function(use)
  -- let packer manage itself
  use 'https://github.com/wbthomason/packer.nvim'

  -- editor modifications
  use 'cohama/lexima.vim'
  use 'https://tpope.io/vim/abolish.git'
  use 'https://tpope.io/vim/sleuth.git'
  use 'https://tpope.io/vim/surround.git'
  use 'https://tpope.io/vim/repeat.git'
  use 'https://tpope.io/vim/commentary.git'
  use 'https://tpope.io/vim/fugitive.git'
  use 'https://github.com/tpope/vim-vinegar.git' -- make netrw awesome

  -- colorschemes
  use 'https://github.com/pineapplegiant/spaceduck'
  use 'https://github.com/rakr/vim-one'
  use 'https://github.com/sainnhe/edge'

  -- IDE features
  use 'https://github.com/neovim/nvim-lspconfig'
  use 'https://github.com/mfussenegger/nvim-jdtls'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
}

end)

-- Tree-Sitter --

-- Borrowed formatting from https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- Add new languages here
    "java",
    "python",
    "javascript",
    "css",
    "html",
    "lua",
  },

  highlight = {
    enable = true,
    -- optimizations can be applied here if needed
  }

}

-- Global LSP configuration --

vim.diagnostic.disable() -- turn off all inline diagnostics.
-- use vim.diagnostic.enable() to restart them.

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<Leader>s', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<Leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
