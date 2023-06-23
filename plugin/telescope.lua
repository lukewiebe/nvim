vim.keymap.set('n', ' ', '<Nop>', { silent = true, remap = false })
-- file quick-switcher
vim.keymap.set('n', '<space>ff', require('telescope.builtin').find_files, {})
-- quicksearch inside files
vim.keymap.set('n', '<space>fg', require('telescope.builtin').live_grep, {})
-- buffer search?
vim.keymap.set('n', '<space>fb', require('telescope.builtin').buffers, {})
-- help search
vim.keymap.set('n', '<space>fh', require('telescope.builtin').help_tags, {})

require('telescope').setup {
  defaults = {
    -- default settings go here
  },

  pickers = {
    -- picker-specific settings go here
  },

  extensions = {
    -- extension configurations go here
  },
}
