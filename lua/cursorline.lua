vim.o.cursorline = true

-- turn cursorline off whenever the window doesn't have focus

local group = vim.api.nvim_create_augroup("CursorLine", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
  group = group,
  command = "silent set cursorline",
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  group = group,
  command = "silent set nocursorline",
})
