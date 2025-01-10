return {

  {
    'epwalsh/obsidian.nvim',
    tag = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    keys = {
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New Obsidian note', mode = 'n' },
      { '<leader>oo', '<cmd>ObsidianSearch<cr>', desc = 'Search Obsidian notes', mode = 'n' },
      { '<leader>os', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick Switch', mode = 'n' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show location list of backlinks', mode = 'n' },
      { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Follow link under cursor', mode = 'n' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste imate from clipboard under cursor', mode = 'n' },
    },
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('obsidian').setup {
        workspaces = {
          {
            name = 'personal',
            path = '/Users/mert/Desktop/notes',
          },
        },
      }
    end,
  },
}
