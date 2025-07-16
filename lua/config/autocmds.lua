local autocmd_group = vim.api.nvim_create_augroup('toggle_number', { clear = true })

-- Toggle relative number
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  group = autocmd_group,
  pattern = '*',
  command = 'set norelativenumber',
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  group = autocmd_group,
  pattern = '*',
  command = 'set relativenumber',
})

