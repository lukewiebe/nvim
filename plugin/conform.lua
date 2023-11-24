-- https://github.com/stevearc/conform.nvim

require("conform").setup({
	formatters_by_ft = {
		javascript = { { "prettierd", "prettier" } },
		java = { "google-java-format" },
		lua = { "stylua" },
		r = { "styler" },
		-- add more filetypes here
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
})

-- source: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Toggle autoformat on save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function(args)
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat on save",
})

-- this is a way to use conform's formatter
-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
