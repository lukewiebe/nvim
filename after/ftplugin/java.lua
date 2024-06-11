-- java.lua

-- configure nvim-jdtls
require("jdtls").start_or_attach({
	cmd = { "jdtls" },
	root_dir = vim.fn.getcwd(),
})
