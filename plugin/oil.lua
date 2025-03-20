-- https://github.com/stevearc/oil.nvim

require("oil").setup({
	keymaps = {
		["<C-x>"] = { "actions.select", opts = { horizontal = true } },
		["y."] = "actions.copy_entry_path",
	},
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name)
			-- if this function returns true for a filename, hide that item
			local ignore = {
				".DS_Store",
				"..",
			}
			return vim.tbl_contains(ignore, name)
		end,
	},
})

-- recreate vinegar's hyphen map
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_user_command("Soil", "split | Oil", { desc = "Open Oil in a horizontal split" })
vim.api.nvim_create_user_command("Voil", "vsplit | Oil", { desc = "Open Oil in a vertical split" })
