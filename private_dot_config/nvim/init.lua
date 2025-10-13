-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- for <localleader>, if you want

require("config.lazy")

require("core.keymaps")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Special characters
vim.opt.list = true
vim.opt.listchars = {
  space = "·", -- show spaces as dots
  tab = "→ ", -- show tabs as arrow + space
  trail = "•", -- trailing spaces
  extends = "⟩", -- when line continues right
  precedes = "⟨", -- when line continues left
}

-- Neovim indentation settings
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4   -- number of spaces per indent
vim.opt.tabstop = 4      -- number of spaces per tab

-- Set 2-space tabs for Lua files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "lua",
  callback = function()
    -- Use vim.opt_local to set options for the current buffer only
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

local typescript_config = require('lsp.typescript');
vim.lsp.config('typescriptls', typescript_config )
vim.lsp.enable('typescriptls')

local dartls_config = require('lsp.dart');
vim.lsp.config('dartls', dartls_config)
vim.lsp.enable('dartls')

local luals_config = require('lsp.lua');
vim.lsp.config('luals', luals_config)
vim.lsp.enable('luals')

-- local java_config = require('lsp.java');
-- vim.lsp.config('javals', java_config)
-- vim.lsp.enable('javals')

vim.opt.signcolumn = 'yes'
