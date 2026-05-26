vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Update Treesitter parsers",
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" then
      -- Run the internal Neovim command provided by the plugin
      vim.cmd("TSUpdate")
      vim.notify("Treesitter: Parsers updated successfully!", vim.log.levels.INFO)
    end
  end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup({
  highlight = { enable = true },
  auto_install = true,
})
