-- Global LSP Configuration --

vim.diagnostic.disable() -- turn off all inline diagnostics.
-- use vim.diagnostic.enable() to restart them.

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(args)
    -- enable LSP omnifunc
    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Buffer local mappings

    local opts = { buffer = args.buf }
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- gd provided by treesitter with LSP fallback
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>r', vim.rsp.buf.rename, opts)
    vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, opts)
  end,
})
