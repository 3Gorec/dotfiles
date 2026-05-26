vim.g.loaded_netrwPlugin = 1

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/mikavilpas/yazi.nvim"
})

require("yazi").setup({
  open_for_directories = false,
  keymaps = {
    show_help = "<f1>",
  },
})

vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>Yazi<cr>", { 
  desc = "Open yazi at the current file" 
})

vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { 
  desc = "Open the file manager in nvim's working directory" 
})

vim.keymap.set("n", "<c-up>", "<cmd>Yazi toggle<cr>", { 
  desc = "Resume the last yazi session" 
})
