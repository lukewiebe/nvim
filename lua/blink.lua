MiniDeps.add({
	source = "https://github.com/saghen/blink.cmp",
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

vim.g.autocomplete = true
