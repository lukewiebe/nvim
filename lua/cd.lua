-- :Cd to change working dir to dir of current buffer

vim.api.nvim_create_user_command("Cd", function(args)
	local dir = require("get_buf_dir")()
	vim.cmd.cd(dir)
end, {})
