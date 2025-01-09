require('catppuccin').setup {
  transparent_background = true,
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
}

vim.cmd 'colorscheme catppuccin-mocha'
require('barbecue.ui').toggle(true)

require('lualine').setup {
  options = {
    theme = 'auto',
  },
}
