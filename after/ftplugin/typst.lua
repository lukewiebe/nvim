require("prose")()

MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$", neigh_pattern = "^[^\\]" })

local preview_pdf = function()
  local pdf_filename = vim.fn.expand("%"):gsub("typ$", "pdf")
  vim.system({ "open", "-a", "Skim", pdf_filename })
end

vim.keymap.set("n", "<space>p", preview_pdf, { buffer = true })

-- add root arg to makeprg
vim.bo.makeprg = "typst compile --diagnostic-format short --root " .. vim.fn.getcwd() .. " %:S"

vim.keymap.set("n", "<space>u", function()
  local pdf_filename = vim.fn.expand("%"):gsub("typ$", "pdf")
  vim.system({ "fish", "-c", "fshare", "-p", pdf_filename })
end)
