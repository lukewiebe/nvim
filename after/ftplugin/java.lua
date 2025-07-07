-- java.lua

-- configure nvim-jdtls
-- https://github.com/mfussenegger/nvim-jdtls
local config = {
  cmd = { "jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)

-- single-file compile and run for small programs
-- set makeprg only if no Makefile or gradlew is present
if vim.fn.glob("gradlew") == "gradlew" then
  vim.bo.makeprg = "gradle"
elseif vim.fn.glob("Makefile") ~= "Makefile" then
  vim.bo.makeprg = "java %"
end
