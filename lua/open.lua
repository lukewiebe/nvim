-- Open.lua
-- wrapper for system open command
--

-- allows for :Open .
-- specify app to open current folder with
-- :Open www . -> open -a WorldWideWeb .
-- could also be extended to handle other OS's where a different open command is used
-- option 1: :Open www -> open -a WorldWideWeb .
-- option 2: :Open www -> open ./www

local config = {
	abbreviations = {
		["www"] = "WorldWideWeb",
	}, -- short names for frequently used apps
	default_action = "folder", -- valid options are "folder" or "file"
	open_cmd = "open", -- replace with an equivalent command on non-macOS
}

vim.api.nvim_create_user_command("Open", function(opts)
	local cmd = { config.open_cmd }
	local args = opts.args
	args = vim.fn.split(args)
	local path = nil
	if #args == 0 then
		if config.default_action == "folder" then
			path = "."
		elseif config.default_action == "file" then
			path = "%"
		end
	elseif #args == 1 then
		-- assume the app was omitted, pass the result straight to open
		path = args[1]
	else
		path = args[2]
		-- if app is an abbreviation, use the full name
		local app = config.abbreviations[args[1]]
		-- otherwise, treat the argument as an app name
		if app == nil then app = args[1] end
		-- add arguments to cmd for app choice
		table.insert(cmd, "-a")
		table.insert(cmd, app)
	end

	path = vim.fn.expand(path) -- expand filenames such as % and .
	table.insert(cmd, path)
	local output = vim.system(cmd, { text = true }):wait()
	-- if output ~= nil then print(vim.inspect(output)) end
end, { nargs = "*" })
