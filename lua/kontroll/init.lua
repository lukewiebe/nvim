-- kontroll-nvim

-- I need a comprehensive list of modes to convert to colors
-- if a color isn't provided, I'll fall back to the normal color
-- if it's a visual mode, fall back to visual
-- I've hardcoded obscure modes to Normal

local M = {}

M.setup = function(opts)
	local config = {
		colors = {
			["Normal"] = "#FFFFFF",
			["Visual"] = "#FF0000",
			["Visual Line"] = "#AA0000",
			["Visual Block"] = "#880000",
			["Insert"] = "#00FF00",
			["Command"] = "#0000FF",
		},
	}
	if opts ~= nil then config = vim.tbl_deep_extend("force", config, opts) end
	vim.g.kontroll_nvim_config = config

	-- check if a keyboard is connected. If not, throw an error and make the user deal with it.
	local on_exit = function(obj)
		if obj.code ~= 0 then error(obj.stderr) end
	end
	vim.system({ "kontroll", "restore-status-leds" }, { text = true }, on_exit)

	-- schedule cleanup: reset keyboard LEDs to default when neovim exits
	vim.api.nvim_create_autocmd("VimLeavePre", {
		-- stylua: ignore
		callback = function()
			vim.system({ "kontroll", "restore-rgb-leds" }, { text = true }):wait()
		end,
	})
end

local change_color = function()
	-- :h mode()
	local modes = {
		["n"] = "Normal",
		["v"] = "Visual",
		["V"] = "Visual Line",
		[""] = "Visual Block",
		["s"] = "Select",
		["i"] = "Insert",
		["R"] = "Replace",
		["c"] = "Command",
		["r"] = "Normal",
		["!"] = "Normal",
		["l"] = "Normal",
	}
	local colors = vim.g.kontroll_nvim_config.colors

	local current_mode = vim.fn.mode()
	-- call to kontroll and set the color
	vim.system({ "kontroll", "set-rgb-all", "--color", colors[modes[current_mode]] }, { text = true }):wait()
end

vim.api.nvim_create_autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("Kontroll", {}),
	callback = change_color,
})

M.setup({})
