require("prose")()

vim.keymap.set("n", "<space>p", function()
  vim.system({ "open", "-a", "Marked 2", vim.fn.expand("%") })
end)
