-- The bones of an NPM wrapper for neovim

-- ideas:


job_id = nil -- set global var
vim.api.nvim_create_user_command("Npm", function()
	job_id = vim.fn.jobstart({ "npm", "run", "dev" }, {
		stderr_buffered = true,
		on_stderr = function(_, data)
			s = table.concat(data, "\n")
			vim.notify(s) -- throw up a notification at the bottom
		end,
	})
end, {nargs = 0})

vim.api.nvim_create_user_command("NpmStop", function()
	local job_exit = vim.fn.jobstop(job_id)
	if job_exit == 1 then
		vim.notify("Job cancelled")
	else
		vim.notify("Invalid job number: " .. job_exit)
	end
end, {nargs = 0})
