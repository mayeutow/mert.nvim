vim.api.nvim_create_augroup('FileTypeIndentation', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeIndentation',
  pattern = 'go,c,cpp',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeIndentation',
  pattern = 'html,svelte',
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
