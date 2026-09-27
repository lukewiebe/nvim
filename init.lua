-- settings

vim.o.hlsearch = true
vim.o.number = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.mouse = "" -- disable mouse, hahaha
vim.o.mousescroll = "ver:1,hor:1" -- scrolling moves one line for smooth trackpad scrolling
vim.o.undofile = true
vim.o.splitright = true -- new vertical splits show up on the right side
vim.o.splitbelow = true -- new horizonal splits appear on the bottom
vim.o.scrolloff = 5 -- keep the cursor off the top or bottom of the window
vim.o.foldmethod = "syntax" -- overridden by treesitter when applicable
vim.o.foldlevel = 99 -- don't fold by default
vim.o.laststatus = 3
vim.o.completeopt = "longest,menu"
vim.o.autowrite = true
vim.o.inccommand = "split"
vim.o.makeprg = "make -j8"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 0 -- use the value of tabstop
vim.o.softtabstop = -1 -- use the value of shiftwidth
vim.o.signcolumn = "number"

-- set cursor to block shape in terminals where the shell does not set the cursor
vim.opt.guicursor:remove({ "t:block-blinkon500-blinkoff500-TermCursor" })
vim.opt.guicursor:append({ "t:ver25" })

if vim.fn.executable("fish") == 1 then vim.o.shell = "fish" end

-- a few keymaps
-- unmap space to use as an alternate leader
vim.keymap.set("n", " ", "<Nop>", { silent = true })

-- remap _ to do linewise up/down navigation, since - is taken by Oil
vim.keymap.set("n", "_", "-", {})

--  toggle mouse
vim.keymap.set("n", "<leader>m", function()
  vim.o.mouse = vim.o.mouse == "" and "a" or ""
  vim.notify("mouse " .. (vim.o.mouse == "a" and "on" or "off"))
end, {})

-- save with <space>w
vim.keymap.set("n", "<space>w", "<cmd>w<cr>", {})
-- :make with <space>m
vim.keymap.set("n", "<space>m", "<cmd>make<cr>", {})

-- autocmd to edit formatoptions to stop making new comments when I press "o" or "O"
-- since this option is set in many filetype commands, an autocmd really is the cleanest way to do this
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("FormatOptions", {}),
  pattern = "*",
  callback = function()
    vim.cmd.set("formatoptions-=o") -- no comment on o and O
  end,
})

-- equalize window size when vim is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("Resize", { clear = true }),
  callback = function() vim.cmd.wincmd("=") end,
})

-- must be set before loading slime
vim.g.slime_target = "neovim"
vim.g.slime_neovim_ignore_unlisted = false

-- package hooks, see :h vim.pack-events

local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind

  if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
    local ts = require("nvim-treesitter")
    ts.install(ts.get_available())
    ts.update()
  end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

-- packages -------------------------------------------------------------------

vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim", version = "stable" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  },
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
  "https://tpope.io/vim/abolish.git",
  "https://tpope.io/vim/sleuth.git",
  "https://tpope.io/vim/surround.git",
  "https://tpope.io/vim/repeat.git",
  "https://tpope.io/vim/fugitive.git",
  "https://github.com/tpope/vim-rhubarb",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/andymass/vim-matchup",
  "https://github.com/tommcdo/vim-exchange",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/dcampos/nvim-snippy",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1.10.2",
  },
  "https://github.com/jpalardy/vim-slime",
  "https://github.com/fasterius/slime-peek.nvim",
})

require("colors")
require("cursorline")
require("lsp")
require("diagnostics")
require("open")
require("commands")

-- vim.keymap.set("n", "<leader>r", function() package.loaded["statusline"] = nil end, {})
vim.o.statusline = "%!v:lua.require'statusline'.statusline()"
