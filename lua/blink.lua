local not_in_comment = function()
	local parser = vim.treesitter.get_parser()
	local trees = parser:parse()
	local root = trees[1]:root()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	line = line - 1 -- reindex to 0 to match treesitter
	local cursor_node = root:descendant_for_range(line, col, line, col)
	if cursor_node:type() == "comment_content" then return false end
	return true
end

MiniDeps.add({
	source = "saghen/blink.cmp",
	checkout = "v0.11.0",
})

require("blink.cmp").setup({
	enabled = function() return vim.g.autocomplete end,
	keymap = {
		preset = "default",
		["<c-k>"] = {},
		["<c-l>"] = { "show_signature", "hide_signature", "fallback" },
	},

	completion = {
		menu = {
			auto_show = function() return vim.g.autocomplete end,
		},
	},

	signature = {
		enabled = true,
	},
})

vim.keymap.set("n", "<leader>cc", function()
	if vim.g.autocomplete then
		vim.g.autocomplete = false
		vim.notify("autocomplete disabled")
	else
		vim.g.autocomplete = true
		vim.notify("autocomplete enabled")
	end
end, {})

vim.g.autocomplete = false
