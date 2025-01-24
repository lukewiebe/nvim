-- java.lua

-- configure nvim-jdtls
-- https://github.com/mfussenegger/nvim-jdtls
require("jdtls").start_or_attach({
	cmd = { "jdtls" },
	root_dir = vim.fn.getcwd(),
})

-- single-file compile and run for small programs
-- set makeprg only if no Makefile is present
if vim.fn.glob("Makefile") ~= "Makefile" then
	vim.bo.makeprg = "java %"
end
