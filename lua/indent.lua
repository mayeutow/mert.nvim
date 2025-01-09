vim.api.nvim_create_user_command('DebugIndent', function()
  local buf = vim.api.nvim_get_current_buf()
  print(
    string.format(
      'Buffer: %d\nFileType: %s\ntabstop: %d\nshiftwidth: %d\nexpandtab: %s\nsoftabstop: %d',
      buf,
      vim.bo[buf].filetype,
      vim.bo[buf].tabstop,
      vim.bo[buf].shiftwidth,
      tostring(vim.bo[buf].expandtab),
      vim.bo[buf].softtabstop
    )
  )
end, {})

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
