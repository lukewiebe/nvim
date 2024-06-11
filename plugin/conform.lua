-- https://github.com/stevearc/conform.nvim

-- copied configuration from
-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#automatically-run-slow-formatters-async
-- for running slow formatters async (i.e. Java)
local slow_filetypes = {}

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		markdown = { "prettier" },
		html = { "prettier" },
		java = { "google-java-format" },
		lua = { "stylua" },
		c = { "clang-format" },
	},
	format_on_save = function(buf)
		if slow_filetypes[vim.bo[buf].filetype] then return end
		local on_format = function(err)
			-- stylua: ignore
			if err and err:match("timeout$") then
				slow_filetypes[vim.bo[buf].filetype] = true
			end
		end
		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,
	format_after_save = function(buf)
		if not slow_filetypes[vim.bo[buf].filetype] then return end
		return { lsp_fallback = true }
	end,
})

-- source: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
vim.api.nvim_create_user_command("ConformDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Toggle autoformat on save",
	bang = true,
})

vim.api.nvim_create_user_command("ConformEnable", function(args)
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat on save",
})
