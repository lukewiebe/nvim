require("prose")

vim.g.TypstAutoOpen = false

-- the following are intended to be used along with a terminal running `typst watch`

local preview_pdf = function()
  local pdf_filename = vim.fn.expand("%"):gsub("typ$", "pdf")
  vim.system({ "sleep", "0.1" }):wait()
  vim.ui.open(pdf_filename)
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*.typ",
  callback = function()
    if not vim.g.TypstAutoOpen then return end
    preview_pdf()
  end,
})

vim.api.nvim_create_user_command("TypstAutoOpen", function()
  vim.g.TypstAutoOpen = not vim.g.TypstAutoOpen
  print("toggled auto-open")
end, {})

vim.keymap.set("n", "<space>p", preview_pdf, { buffer = true })
