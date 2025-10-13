return {
  -- Autocompletion engine
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Source for LSP suggestions
    'hrsh7th/cmp-nvim-lsp',

    -- Source for suggestions from the current buffer
    'hrsh7th/cmp-buffer',

    -- Source for file system path suggestions
    'hrsh7th/cmp-path',

    -- Snippet engine
    'L3MON4D3/LuaSnip',

    -- Source for snippet suggestions
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      -- Configure snippet support
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Key mappings for the completion menu
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Move up
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Move down
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
        ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll docs down
        ['<C-Space>'] = cmp.mapping.complete(),     -- Manually trigger completion
        ['<C-e>'] = cmp.mapping.abort(),            -- Close the completion menu
        -- Confirm selection: selecting a suggestion will insert it
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),

      -- Define the sources for suggestions (in order of priority)
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Language Server Protocol
        { name = 'luasnip' },  -- Snippets
        { name = 'buffer' },   -- Words from the current file
        { name = 'path' },     -- File system paths
      }),
    })
  end,
}
