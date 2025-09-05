-- https://github.com/stevearc/oil.nvim

local oil = require("oil")

oil.setup({
  keymaps = {
    ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
    ["y."] = "actions.copy_entry_path",
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      -- if this function returns true for a filename, hide that item
      local ignore = {
        ".DS_Store",
        "..",
      }
      if vim.tbl_contains(ignore, name) then return true end

      -- ignore pdfs if there is a typst file with the same name
      if name:sub(-4) ~= ".pdf" then return false end
      local name_no_extension = name:sub(1, -5)
      local dir = oil.get_current_dir(bufnr)

      for file in vim.fs.dir(dir) do
        if file:sub(1, -5) == name_no_extension then return true end
      end

      return false
    end,
  },
})

-- recreate vinegar's hyphen map
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_user_command("Soil", "split | Oil", { desc = "Open Oil in a horizontal split" })
vim.api.nvim_create_user_command("Voil", "vsplit | Oil", { desc = "Open Oil in a vertical split" })
