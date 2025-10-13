return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Add the ui-select extension
    "nvim-telescope/telescope-ui-select.nvim",
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  },
  config = function()
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
          initial_mode = "normal", -- open in normal mode
          sort_lastused = true,    -- optional: show most recent buffers first
          -- This function runs when the buffers picker is attached
          attach_mappings = function(prompt_bufnr, map)
            -- This maps <leader>d in Normal mode to delete the buffer
            map("n", "<leader><C-d>", require("telescope.actions").delete_buffer)

            -- The `true` at the end tells telescope to also load the default mappings.
            -- Set it to `false` if you want to ONLY use your custom mappings.
            return true
          end,
        },
        oldfiles = {
          initial_mode = "normal", -- open in normal mode
          sort_lastused = true,    -- optional: show most recent buffers first
        },
      },
    })

    -- To get ui-select loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function called.
    telescope.load_extension("ui-select")

    -- Keymaps (you can change <leader>f, <leader>g, etc. to taste)
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
  end,
}
