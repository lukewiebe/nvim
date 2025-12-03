-- https://github.com/jpalardy/vim-slime
-- https://github.com/fasterius/slime-peek.nvim

vim.g.slime_target = "neovim"
vim.g.slime_neovim_ignore_unlisted = false

MiniDeps.add("https://github.com/jpalardy/vim-slime")
MiniDeps.add("https://github.com/fasterius/slime-peek.nvim")

vim.api.nvim_create_user_command("Radian", function()
  vim.cmd("vsp | terminal radian")
  local job_id = vim.b.terminal_job_id
  vim.cmd.wincmd("p") -- goto previous window
  vim.b.slime_config = { job_id = job_id }
end, {})

local peek = require("slime_peek")
peek.setup()
