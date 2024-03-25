-- :Cd to change working dir to dir of current buffer

vim.api.nvim_create_user_command("Cd", function(args)
	local dir = vim.fn.expand("%:h")
	-- handle oil buffers by stripping the oil:// from the front
	dir = string.gsub(dir, "^oil://(.*)", "%1")
	vim.cmd.cd(dir)
end, {})
