-- Small user commands I find helpful

-- :Finder opens the Finder to the parent directory of the current buffer

vim.api.nvim_create_user_command("Finder", function(args)
	local dir = require("get_buf_dir")()
	vim.ui.open(dir)
end, {})

-- :Cd to change working dir to dir of current buffer

vim.api.nvim_create_user_command("Cd", function(args)
	local dir = require("get_buf_dir")()
	vim.cmd.cd(dir)
end, {})

-- :Copy to quickly copy an entire buffer to the clipboard
-- could easily add ranges to it, but then why not copy using "*y

vim.api.nvim_create_user_command("Copy", function()
	local buf = vim.api.nvim_get_current_buf()
	local buffer_contents = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	buffer_contents = table.concat(buffer_contents, "\n")
	vim.fn.setreg("*", buffer_contents)
end, {})
