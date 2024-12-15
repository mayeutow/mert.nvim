return {
  { 'nvim-tree/nvim-web-devicons' },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('everforest').setup {
        background = 'hard',
        transparent_background_level = 1,
        italics = false,
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ['html'] = {
            enable_close = false,
          },
        },
      }
    end,
  },

  {
    'barrett-ruth/live-server.nvim',
    build = 'pnpm add -g live-server',
    cmd = { 'LsR', 'LsS' },
    config = true,
  },

  { 'EdenEast/nightfox.nvim', priority = 1000, lazy = false },

  { 'kyazdani42/nvim-web-devicons' },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  { 'rebelot/kanagawa.nvim', as = 'kanagawa' },

  { 'rose-pine/neovim', as = 'rose-pine' },

  { 'scottmckendry/cyberdream.nvim', as = 'cyberdream' },

  { 'navarasu/onedark.nvim', as = 'navarasu' },

  { 'tiagovla/tokyodark.nvim', as = 'tokyodark' },

  {
    'folke/tokyonight.nvim',
  },

  { 'SmiteshP/nvim-navic' },

  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    ft = 'markdown',
    event = { 'BufReadPre path/to/your/vault/**.md' },
    config = function()
      require('obsidian').setup {
        dir = 'C:/Users/mert/Desktop/notes', -- set your vault directory here
      }
    end,
  },
}
