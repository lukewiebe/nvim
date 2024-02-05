-- User command :Finder opens the Finder to the parent directory of the current buffer.
-- If we are in Oil, opens the current directory.

vim.api.nvim_create_user_command("Finder", function(args)
	local dir = vim.fn.expand("%:h")
	dir = string.gsub(dir, "^oil://(.*)", "%1")
	vim.fn.jobstart({ "open", dir }, { detach = true })
end, {})
