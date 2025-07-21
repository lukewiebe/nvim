-- Base settings for any document that is prose.
-- e.g. markdown and variants

vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true })
vim.o.linebreak = true
