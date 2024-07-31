-- Open.lua
-- wrapper for system open command

-- Accepts two arguments: application and file/folder
-- if one argument is given, assumes file/folder

-- TODO:
-- allow use of a setup function or global table (vim.g.open) to override default config

local config = {
	---@type { [string]: string } short names for frequently used apps
	abbreviations = {
		["www"] = "WorldWideWeb",
		["marked"] = "Marked 2",
	},
	---@type "folder" | "file" if no arguments are given, open file or folder
	default_action = "folder",
	---@type string the command used to power :Open
	open_cmd = "open",
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
