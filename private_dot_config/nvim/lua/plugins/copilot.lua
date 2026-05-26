return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      suggestion = {
        -- Enable auto-triggering of suggestions
        auto_trigger = true,
        -- Use the Tab key to accept suggestions
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-Right>", -- Alt + Right Arrow accepts one word
          accept_line = "<M-Down>",  -- Alt + Down Arrow accepts one line
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
