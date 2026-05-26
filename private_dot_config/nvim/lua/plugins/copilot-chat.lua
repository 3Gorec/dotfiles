return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- This acts as your DEFAULT layout (Float)
      window = {
        layout = 'float',
        width = 0.7,
        height = 0.95,
        row = 0,
        border = 'rounded',
        title = 'Copilot',
      },
      headers = {
        tool = '🔧 Tool',
      },
      separator = '━━',
      auto_fold = true,
    },
    keys = {
      -- 1. Toggle Default (Floating Window)
      {
        "<leader>cct",
        "<cmd>CopilotChatToggle<CR>",
        desc = "Toggle Copilot Chat (Float)",
      },
      -- 2. Toggle Override (Vertical Split)
      {
        "<leader>ccv",
        function()
          require("CopilotChat").toggle({
            window = {
              layout = 'vertical',
              width = 0.3, -- Takes up 30% of your screen
            },
          })
        end,
        desc = "Toggle Copilot Chat (Vertical Split)",
      },
    },
  },
}
