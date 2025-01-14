require 'settings'
require 'plugins.lazy'
require 'keymaps'
require 'indents'
require 'themeconfig'
require 'plugins.health'

-- for some reason this just doesn't work on its own even though it's enabled
vim.cmd 'TSEnable highlight'
-- vim: ts=2 sts=2 sw=2 et
