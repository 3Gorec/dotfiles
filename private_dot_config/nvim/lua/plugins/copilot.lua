return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        -- Enable auto-triggering of suggestions
        auto_trigger = true,
        -- Use the Tab key to accept suggestions
        keymap = {
          accept = "<Tab>",
          dismiss = "<C-e>",
        },
      },
    })

    -- Keymap to toggle copilot on/off
    vim.keymap.set("n", "<leader>ct", "<cmd>Copilot toggle<CR>", {
      desc = "Toggle Copilot",
    })
  end,
}
