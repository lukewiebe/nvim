-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hipatterns.md

local hipatterns = require("mini.hipatterns")

local data = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo", link = false })
data.bold, data.reverse = true, true
data.cterm = { bold = true, reverse = true }
vim.api.nvim_set_hl(0, "MiniHipatternsDebug", data)

hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'TODO', 'NOTE'
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    debug = { pattern = "%f[%w]()DEBUG()%f[%W]", group = "MiniHipatternsDebug" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
