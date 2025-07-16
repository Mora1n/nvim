-- Toggle relative number
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*', 
  command = 'set norelativenumber',
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*', 
  command = 'set relativenumber',
})

