-- tools for running R scripts effectively from Neovim

local print_output = function(data)
	print(vim.inspect(data))
end

local start_r_console = function()
	-- command: `R --slave --no-save`
	local cmd = { "R", "--slave", "--no-save" }
	-- local cmd = { "cat" }
	local job_id = vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			if data then
				print("stdout:")
				print_output(data)
			end
		end,
		on_stderr = function(_, data)
			if data then
				print("stderr:")
				print_output(data)
			end
		end,
		on_exit = function()
			print("job exited")
		end,
	})
	print(job_id) -- DEBUG
	return job_id
end

local job = start_r_console()
-- vim.fn.chansend(job, { "options(flush.console = TRUE)" })
vim.fn.chansend(job, { "print('hello')" })
vim.fn.chansend(job, { "console.flush()" })

-- Problem: R buffers its output
-- Solution: configure R to not do that
