-- Treesitter
--
-- Neovim 0.12 ships the tree-sitter highlighter and parser loader itself, so
-- nvim-treesitter is only used to install parsers + queries here.
--
-- The `main` branch is the version that targets 0.12+: it has no
-- `nvim-treesitter.configs` module, no `highlight`/`indent` options and no
-- `:TSEnable` command anymore (the old `master` branch is frozen for 0.11).
--
-- Requirements of the `main` branch:
--   * tree-sitter-cli >= 0.26.1 installed through your package manager (NOT npm)
--   * a C compiler, `curl` and `tar` in your `$PATH`

local parsers = {
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Installs the missing parsers/queries, no-op for the ones already there.
      require('nvim-treesitter').install(parsers)

      -- Tree-sitter features are opt-in per buffer in 0.12: highlighting,
      -- indentation, ... are enabled from a FileType autocommand (or ftplugin).
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('kickstart-treesitter', { clear = true }),
        desc = 'Enable tree-sitter highlighting (and indentation) when a parser is available',
        callback = function(event)
          local buf = event.buf
          local ft = vim.bo[buf].filetype

          -- Errors out when no parser is installed for `ft`, which is fine:
          -- the buffer then simply keeps its regular syntax highlighting.
          if not pcall(vim.treesitter.start, buf) then
            return
          end

          -- Keep Vim's regex based syntax highlighting for ruby on top of it.
          if ft == 'ruby' then
            vim.bo[buf].syntax = 'ON'
          end

          -- Treesitter indentation is provided by nvim-treesitter and needs an
          -- `indents` query for the language.
          if ft ~= 'ruby' and vim.treesitter.query.get(ft, 'indents') then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy.global,
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
}
