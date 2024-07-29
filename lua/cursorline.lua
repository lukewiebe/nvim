vim.o.cursorline = true

-- turn cursorline off whenever the window doesn't have focus

local group = vim.api.nvim_create_augroup("CursorLine", { clear = true })

-- when nvim loses focus to tmux or another OS window
vim.api.nvim_create_autocmd("FocusLost", {
	group = group,
	command = "silent set nocursorline",
})
vim.api.nvim_create_autocmd("FocusGained", {
	group = group,
	command = "silent set cursorline",
})

-- when I switch panes in nvim
vim.api.nvim_create_autocmd("WinEnter", {
	group = group,
	command = "silent set cursorline",
})
vim.api.nvim_create_autocmd("WinLeave", {
	group = group,
	command = "silent set nocursorline",
})
