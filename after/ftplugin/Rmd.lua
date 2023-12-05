require("prose")
vim.keymap.set("n", "<leader>r", "<cmd>w<CR>:!~/sd/r/render2html %<CR>", { buffer = true })
vim.keymap.set("n", "<leader>t", "<cmd>w<CR>:!~/sd/r/render2pdf %<CR>", { buffer = true })

-- from https://github.com/windwp/nvim-autopairs
local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
local cond = require("nvim-autopairs.conds")
npairs.add_rule(Rule("$", "$", "rmd"):with_move(cond.done()))

-- remove italics on comments, it also hits code blocks apparently
require("update_highlight")("Comment", { italic = false })
