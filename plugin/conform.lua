-- https://github.com/stevearc/conform.nvim

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		markdown = { "prettier" },
		html = { "prettier" },
		java = { "google-java-format" },
		lua = { "stylua" },
		c = { "clang-format" },
		fish = { "fish_indent" },
		zig = { "zigfmt" },
		cpp = { "clang-format" },
	},
})

vim.keymap.set("n", "<space>f", function()
	local run_async = {
		"zig",
		"java",
	}
	if vim.tbl_contains(run_async, vim.bo.filetype) then
		conform.format({ async = true })
	else
		conform.format()
	end
	vim.notify("formatted")
end, {})
