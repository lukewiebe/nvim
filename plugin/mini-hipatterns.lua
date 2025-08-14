-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hipatterns.md

local hipatterns = require("mini.hipatterns")

hipatterns.setup({
  highlighters = {
    -- Highlight standalone ' TODO:', ' NOTE:'
    todo = { pattern = "() %f[%w]TODO%f[%W]:()", group = "MiniHipatternsTodo" },
    -- todo = { pattern = " %f[%w]TODO%f[%W]():()", group = "MiniHipatternsTodoColon" },
    note = { pattern = "() %f[%w]NOTE%f[%W]:()", group = "MiniHipatternsNote" },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
