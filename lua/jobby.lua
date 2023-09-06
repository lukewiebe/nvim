-- Jobby.nvim: A tiny, opinionated job runner for Neovim --

-- Note: when testing, :bd with tab completion will close buffers
-- :set wildmode=list:longest,full

-- input: jobname as string
local create_job_buf = function(jobname)
	local buf = vim.api.nvim_create_buf(true, true) -- scratch buffer in buflist
	vim.api.nvim_buf_set_name(buf, jobname)
	return buf
end

local run_job_ongoing = function(opts)
	local command_to_run = opts--.args (re-add when in use)
	local buf = create_job_buf(command_to_run) -- create buffer for this job
	command_to_run = vim.fn.split(command_to_run)

	-- start the jobs
	job_id = vim.fn.jobstart(command_to_run, {
		stderr_buffered = true,
		on_stderr = function(_, data)
			local s = table.concat(data, "\n")
			vim.notify(s)
		end,
		stdout_buffered = true,
		on_stdout = function(_, data)
			local s = table.concat(data, "\n")
		end,
	})
end

-- test run function
-- produces stderr
run_job_ongoing("ls -4")

-- produces stdout
-- run_job_ongoing("ls")

-- vim.api.nvim_create_user_command("Jobby", function(opts)
-- 	local command_to_run = opts.args
-- 	print(command_to_run)
-- end, { nargs = "*" })
