return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      window = {
        layout = 'float',
        width = 0.7,        -- Fixed width in columns
        height = 0.95,      -- Fixed height in rows
        row = 0,
        border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
        title = 'Copilot',
        -- zindex = 100,       -- Ensure window stays on top
      },

      headers = {
        tool = '🔧 Tool',
      },

      separator = '━━',
      auto_fold = true, -- Automatically folds non-assistant messages
    },
  },
}
