vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/sindrets/diffview.nvim",
})

require("diffview").setup();

vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })
