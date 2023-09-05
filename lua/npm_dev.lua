-- User command to run `npm run dev` in a short split window
-- simple version that uses :term instead of vim.fn.jobstart()

vim.api.nvim_create_user_command("NpmDev", function()
	local bufhandle = vim.api.nvim_create_buf( false, false )
	vim.cmd.split()
	vim.cmd.resize(8)
	vim.api.nvim_set_current_buf(bufhandle)
	vim.fn.termopen("npm run dev")
	vim.cmd.startinsert()
end,
{ nargs = 0 })
