require("prose")()

local preview_pdf = function()
  local pdf_filename = vim.fn.expand("%"):gsub("typ$", "pdf")
  vim.system({ "open", "-a", "Skim", pdf_filename })
end

vim.keymap.set("n", "<space>p", preview_pdf, { buffer = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("TypstAutoCompile", {}),
  callback = function()
    vim.system({ "typst", "compile", "--root", vim.fn.getcwd(), vim.fn.expand("%") })
  end,
})

-- add root arg to makeprg
vim.bo.makeprg = "typst compile --diagnostic-format short --root " .. vim.fn.getcwd() .. " %:S"
