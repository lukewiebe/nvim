-- https://zignar.net/2022/01/21/a-boring-statusline-for-neovim/
-- :h statusline

local M = {}

M.statusline = function()
	local parts = {
		[[%{luaeval("require('statusline').git()")} ]],
		[[%{luaeval("require('statusline').fileformat()")}]],
		[[%<%f %m%r%=]], -- truncatable filename, [+] if modified, [RO] if read-only
		[[%-14{luaeval("require('statusline').ruler()")} %P]],
		-- [[%-14.(%l,%c%V%) %P]], -- default ruler
	}
	return table.concat(parts, "")
end

M.fileformat = function()
	if vim.o.fileformat ~= "unix" then
		return string.format("!%s! ", vim.o.fileformat)
	end
	return ""
end

-- my replacement for the builtin ruler
M.ruler = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	col = col + 1 -- shift from 0-index to 1-index
	result = string.format("%s,%s", row, col)

	local v_start = vim.fn.getcharpos("v")
	local v_row = v_start[2]
	local v_col = v_start[3]

	-- show range for visual selection
	if col ~= v_col then
		local min = math.min(col, v_col)
		local max = math.max(col, v_col)
		result = string.format("%s,%s-%s (%s chars)", row, min, max, max - min + 1)
	end

	return result
end

-- see fugitive source (/plugin/fugitive.vim) for API documentation
M.git = function()
	local head = vim.fn.FugitiveHead(7) -- hash truncated to 7 characters
	if head == "" then return "" end
	return string.format("(%s)", head)
end

return M
