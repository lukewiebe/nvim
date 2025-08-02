-- global LSP config

MiniDeps.later(function()
  -- enable configured LSP servers
  -- a server is configured if it has a file like lsp/server_name.lua
  local lsp_configs = vim.fs.dir(vim.fn.stdpath("config") .. "/lsp")
  local lsp_server_names = {}

  -- iteratively build a list of configs to enable
  for lsp_filename in lsp_configs do
    local lsp_server_name = lsp_filename:sub(1, -5) -- remove '.lua' file extension
    table.insert(lsp_server_names, lsp_server_name)
  end

  vim.lsp.enable(lsp_server_names)

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client == nil then return end

      -- disable syntax highlight, just use treesitter for that
      client.server_capabilities.semanticTokensProvider = nil
    end,
  })
end)
