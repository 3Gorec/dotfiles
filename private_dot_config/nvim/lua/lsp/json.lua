return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
}
