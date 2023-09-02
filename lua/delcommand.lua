-- User command to delete user commands.

vim.api.nvim_create_user_command('DelCommand', function(opts)
	vim.api.nvim_del_user_command(opts.args)
end,
{ nargs = 1 })
