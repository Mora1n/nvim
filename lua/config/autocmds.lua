-- Toggle relative line numbers based on mode.
vim.opt.number = true
vim.opt.relativenumber = true

local number_toggle_augroup = vim.api.nvim_create_augroup('NumberToggle', { clear = true })

-- Use relative numbers in normal mode.
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = number_toggle_augroup,
  pattern = "*",
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

-- Use absolute numbers in insert mode.
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = number_toggle_augroup,
  pattern = "*",
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
    end
  end,
})
