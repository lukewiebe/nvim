--  COLORS --

vim.cmd.colorscheme("spaceduck")
-- tweak some color choices
-- nvim_set_hl() wipes out the color group, so I need to rebuild the parts I want to keep manually
-- TODO: redo this with vimscript commands, they're much better behaved
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "none", ctermfg = 237 })
vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "none", ctermfg = 237 })
