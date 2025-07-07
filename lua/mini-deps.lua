-- https://github.com/echasnovski/mini.deps

-- bootstrap mini-deps (requires git)
local path_package = vim.fn.stdpath("data") .. "/site/"
local deps_path = path_package .. "pack/deps/start/mini-deps"
if not vim.loop.fs_stat(deps_path) then
  vim.cmd('echo "Installing mini-deps" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    deps_path,
  }
  vim.system(clone_cmd):wait()
  vim.cmd("packadd mini-deps | helptags ALL")
  vim.cmd('echo "Installed mini-deps" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add = MiniDeps.add

add({
  source = "https://github.com/echasnovski/mini.deps",
  checkout = "stable",
})

add({
  source = "https://github.com/nvim-telescope/telescope.nvim",
  checkout = "0.1.x",
  depends = {
    "https://github.com/nvim-lua/plenary.nvim",
    {
      source = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
      hooks = {
        post_install = function(args) vim.system({ "make" }, { cwd = args.path }):wait() end,
        post_checkout = function(args) vim.system({ "make" }, { cwd = args.path }):wait() end,
      },
    },
  },
})

-- tree-sitter
add({
  source = "https://github.com/nvim-treesitter/nvim-treesitter",
  hooks = { post_checkout = function() vim.cmd("TSUpdate") end },
})
add("https://github.com/nvim-treesitter/nvim-treesitter-textobjects")
add("https://github.com/nvim-treesitter/nvim-treesitter-refactor")
add("https://github.com/windwp/nvim-ts-autotag")

add("https://github.com/m4xshen/autoclose.nvim") -- sensible bracket autoclose behaviour
add("https://tpope.io/vim/abolish.git") -- Subvert and siblings
add("https://tpope.io/vim/sleuth.git") -- match editor settings to file
add("https://tpope.io/vim/surround.git") -- needs no introduction
add("https://tpope.io/vim/repeat.git") -- dot repeat for tpope stuff
add("https://tpope.io/vim/fugitive.git") -- git client
add("https://github.com/tpope/vim-rhubarb") -- github addition to fugitive
add("https://github.com/stevearc/oil.nvim") -- replace netrw with a better pane file explorer
add("https://github.com/andymass/vim-matchup") -- better % jumps
add("https://github.com/tommcdo/vim-exchange") -- cx operator
add("https://github.com/stevearc/dressing.nvim") -- simple UI improvement

add("https://github.com/folke/todo-comments.nvim") -- pretty TODO: comments

add("https://github.com/stevearc/conform.nvim") -- formatter
add("https://github.com/dcampos/nvim-snippy") -- minimal snippet plugin

-- Language/project specific
add("https://github.com/mfussenegger/nvim-jdtls") -- Java LSP integration

-- trial
add("https://github.com/NvChad/nvim-colorizer.lua") -- show colors like #FF00FF in text
add("https://github.com/sindrets/diffview.nvim") -- git diffs

-- mine
add("https://github.com/lukewiebe/kontroll.nvim")
