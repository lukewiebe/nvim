-- equalize window size when vim is resized

vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("LukeResize", { clear = false }),
	callback = function()
		vim.cmd.wincmd("=")
	end,
})
