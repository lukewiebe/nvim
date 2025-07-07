MiniDeps.later(function()
  MiniDeps.add("https://github.com/ibhagwan/fzf-lua")
  local fzf = require("fzf-lua")
  fzf.setup({
    "telescope",
  })

  vim.keymap.set("n", "<space>sf", fzf.files, {})
  vim.keymap.set("n", "<space>sg", fzf.live_grep_native, {})
  vim.keymap.set("n", "<space>sb", fzf.buffers, {})
  vim.keymap.set("n", "<space>sh", fzf.helptags, {})
  vim.keymap.set("n", "<space>sp", fzf.resume, {})
end)
