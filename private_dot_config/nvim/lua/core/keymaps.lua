-- Key mappings
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })

vim.keymap.set("n", "gf", vim.diagnostic.open_float, { buffer = bufnr, desc = "Exit insert mode with jk" })

-- Move selected lines up and down in Visual mode
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Move with Ctrl + hjkl in Insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>',   { desc = 'Move up' })
vim.keymap.set('i', '<C-l>', '<Right>',{ desc = 'Move right' })

vim.keymap.set("n", "<leader>gq", "mzggVGgq'z", { desc = "Format file" })

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
