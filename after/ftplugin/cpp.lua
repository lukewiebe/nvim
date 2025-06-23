-- single-file compile and run for small exercises
-- set makeprg only if no Makefile is present
if vim.fn.glob("Makefile") ~= "Makefile" then
	vim.bo.makeprg = "clang++ -g -Wpedantic -std=c++20 % && ./a.out"
end

vim.o.shiftwidth = 0
