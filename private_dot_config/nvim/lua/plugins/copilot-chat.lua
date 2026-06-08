-- Build hook (runs only when the plugin is newly installed or updated)
vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Build CopilotChat tiktoken",
  callback = function(ev)
    if ev.data.spec.name == "CopilotChat.nvim" then
      local path = vim.fn.stdpath("data") .. "/site/pack/core/opt/CopilotChat.nvim"
      vim.system({ "make", "tiktoken" }, { cwd = path }):wait()
      vim.notify("CopilotChat: Built tiktoken successfully!", vim.log.levels.INFO)
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

require("CopilotChat").setup({
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
  auto_fold = false,
})

vim.keymap.set("n", "<leader>cct", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat (Float)" })
vim.keymap.set(
  "n",
  "<leader>ccv",
  function()
    require("CopilotChat").toggle({ window = { layout = 'vertical', width = 0.4, }, })
  end,
  { desc = "Toggle Copilot Chat (Vertical Split)" }
)
