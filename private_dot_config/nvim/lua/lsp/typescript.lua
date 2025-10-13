return {
  cmd = {
    "typescript-language-server",
    "--stdio"
  },
  root_markers = {
    "tsconfig.json",
    "package.json",
    ".git"
  },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  init_options = {
    hostInfo = 'neovim'
  },
  settings = {
    typescript = {
      format = {
        indentSize = 4,
        tabSize = 4,
      },
    },
    javascript = {
      format = {
        indentSize = 4,
        tabSize = 4,
      },
    },
  },
}
