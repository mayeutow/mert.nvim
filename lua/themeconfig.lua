require('catppuccin').setup {
  transparent_background = false,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    rainbow_delimiters = true,
    treesitter = true,
    treesitter_context = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = 'mocha',
    },
  },
  color_overrides = {
    mocha = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    },
  },
}

require('rose-pine').setup {
  styles = {
    bold = true,
    italic = true,
  },
}

vim.cmd 'colorscheme rose-pine-main'
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")

-- i forgot what this plugin does and i'm to lazy to check
require('barbecue.ui').toggle(true)

-- require 'plugins.feline_rose'
-- require('lualine').setup {
--   options = {
--     theme = 'auto',
--   },
-- }
