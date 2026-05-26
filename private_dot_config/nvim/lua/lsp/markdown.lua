local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_bin_path = vim.fn.stdpath("data") .. "/mason/bin/markdown-oxide"

return {
  cmd = { mason_bin_path },
  
  -- Add this block: It intercepts the server on startup and disables formatting
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  
  capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }
  ),
}
