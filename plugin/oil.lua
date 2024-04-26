-- https://github.com/stevearc/oil.nvim
-- most settings copied from readme

require("oil").setup({
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-s>"] = "actions.select_vsplit",
		["<C-x>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["~"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["gs"] = "actions.change_sort",
		["g."] = "actions.toggle_hidden",
		["y."] = "actions.copy_entry_path",
		["gx"] = "actions.open_external",
	},
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, bufnr)
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
