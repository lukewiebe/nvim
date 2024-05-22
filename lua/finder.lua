-- User command :Finder opens the Finder to the parent directory of the current buffer.

vim.api.nvim_create_user_command("Finder", function(args)
	local dir = require("get_buf_dir")()
	-- vim.fn.jobstart({ "open", dir }, { detach = true })
	vim.ui.open(dir)
end, {})
