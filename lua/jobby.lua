-- Jobby.nvim: A tiny, opinionated job runner for Neovim --

local create_job_buf = function(jobname)
	local buf = vim.api.nvim_create_buf(true, true) -- scratch buffer in buflist
	jobname = "Jobby: " .. jobname
	vim.api.nvim_buf_set_name(buf, jobname)
	return buf
end

local write_to_job_buffer = function(buf, lines)
	vim.api.nvim_buf_set_lines(buf, -1, -1, false, lines)
end

-- write to buffer, notfy or not based on switch
local process_output = function(buf, data, notify)
	if notify == true then
		local s = table.concat(data, "\n")
		vim.notify(s)
	end
	write_to_job_buffer(buf, data)
end

local job_is_running = function()
	local ran, error_message = pcall(vim.api.nvim_buf_get_var, 0, "jobby_job_id")
	return not ran
end

local jobby_set_buf_vars = function(job_id, buf)
	vim.api.nvim_buf_set_var(0, "jobby_job_id", job_id)
	vim.api.nvim_buf_set_var(0, "jobby_buf_id", buf)
end

local run_job_on_save = function(user_input)
	-- cancel if job is already running
	if not job_is_running() then
		print("Job already running")
		return
	end

	local buf = create_job_buf(user_input)
	local command_to_run = vim.fn.expandcmd(user_input)

	-- start the job
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("JobbyRunOnSave", { clear = true }),
		pattern = vim.fn.expand("%:t"), -- current buffer filename
		callback = function()
			-- all output is important, so capture stdout and stderr to buffer and notify
			vim.fn.jobstart(command_to_run, {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stdout = function(_, data)
					process_output(buf, data, true)
				end,
				on_stderr = function(_, data)
					process_output(buf, data, true)
				end,
			})
		end,
	})
	jobby_set_buf_vars(job_id, buf)
end

local run_job_ongoing = function(user_input)
	-- cancel if job is already running
	if not job_is_running() then
		print("Job already running")
		return
	end

	local buf = create_job_buf(user_input)
	local command_to_run = vim.fn.expandcmd(user_input)

	-- start the job
	job_id = vim.fn.jobstart(command_to_run, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stderr = function(_, data)
			process_output(buf, data, true)
		end,
		on_stdout = function(_, data)
			process_output(buf, data, false)
		end,
	})
	jobby_set_buf_vars(job_id, buf)
end

-- Cleans up jobby completely, no matter the borked state
vim.api.nvim_create_user_command("JobbyStop", function()
	-- kill ongoing command
	local job_to_stop = vim.api.nvim_buf_get_var(0, "jobby_job_id")
	local jobby_buf = vim.api.nvim_buf_get_var(0, "jobby_buf_id")
	pcall(vim.fn.jobstop, job_to_stop) -- ignore errors if there's no ongoing jobs
	-- kill augroup
	vim.api.nvim_clear_autocmds({ group = "JobbyRunOnSave" })
	-- delete buffer
	vim.api.nvim_buf_delete(jobby_buf, {})
	vim.api.nvim_buf_del_var(0, "jobby_job_id")
	vim.api.nvim_buf_del_var(0, "jobby_buf_id")
end, { nargs = 0 })

-- Our boy the main command
vim.api.nvim_create_user_command("Jobby", function(opts)
	run_job_ongoing(opts.args)
end, { nargs = "*" })

-- On save variant
vim.api.nvim_create_user_command("JobbyOnSave", function(opts)
	run_job_on_save(opts.args)
end, { nargs = "*" })
