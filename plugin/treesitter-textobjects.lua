-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main

MiniDeps.later(function()
  require("nvim-treesitter-textobjects").setup({
    select = {
      lookahead = true, -- jump forward to next object, like ci)
      include_surrounding_whitespace = false, -- function like 'ap' when on
      selection_modes = {
        -- default is 'v'
        ["@function.outer"] = "V",
        ["@class.outer"] = "V",
      },
    },
    move = {
      set_jumps = true,
    },
  })

  local select = require("nvim-treesitter-textobjects.select")
  local move = require("nvim-treesitter-textobjects.move")

  -- select keymaps
  vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@function.outer", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@function.inner", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
  vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)

  -- move keymaps
  -- function
  vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)

  -- class
  vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_start("@class.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)
  vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_end("@class.outer", "textobjects") end)
end)
