-- https://github.com/stevearc/conform.nvim

require("conform").setup({
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
	},
})

vim.keymap.set("n", "<space>f", function()
	require("conform").format()
	vim.notify("formatted")
end, {})

vim.g.zig_fmt_autosave = 0 -- incredibly annoying default, can be removed in nvim >0.11
