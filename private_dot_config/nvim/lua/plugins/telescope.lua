-- Runs 'make' automatically when telescope-fzf-native is first installed or updated
vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Build telescope-fzf-native",
  callback = function(ev)
    if ev.data.spec.name == "telescope-fzf-native.nvim" then
      local path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
      vim.system({ "make" }, { cwd = path }):wait()
      vim.notify("Telescope fzf-native compiled successfully!", vim.log.levels.INFO)
    end
  end,
})

-- Load Plenary and the extensions first, then Telescope itself
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55
      },
      vertical = { mirror = false },
    },
    sorting_strategy = "ascending",
  },
  pickers = {
    find_files = {
      -- hidden = true, -- show hidden files
    },
    buffers = {
      initial_mode = "normal", 
      sort_lastused = true,    
      attach_mappings = function(prompt_bufnr, map)
        map("n", "<leader><C-d>", require("telescope.actions").delete_buffer)
        return true
      end,
    },
    oldfiles = {
      initial_mode = "normal", 
      sort_lastused = true,    
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
})

-- These must be called after setup()
telescope.load_extension("ui-select")
telescope.load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
