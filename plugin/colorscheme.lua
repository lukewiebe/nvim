--  COLORS --
vim.o.termguicolors = true

vim.cmd.colorscheme("spaceduck")
-- tweak some color choices
-- nvim_set_hl() wipes out the color group, so I need to rebuild the parts I want to keep manually
-- TODO: redo this with vimscript commands, they're much better behaved

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", fg = "#30365F" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#30365F" })


-- -- embark testing
-- vim.cmd.colorscheme("embark")
