vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/AckslD/nvim-neoclip.lua",
})

require('neoclip').setup({
  initial_mode = "normal",
})

vim.keymap.set("n", "<leader>y", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip history" })
