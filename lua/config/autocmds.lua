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

-- Performance optimizations for large files
local perf_augroup = vim.api.nvim_create_augroup('PerformanceOptimizations', { clear = true })

vim.api.nvim_create_autocmd('BufReadPre', {
  group = perf_augroup,
  pattern = '*',
  callback = function(args)
    local buf = args.buf
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

    if ok and stats then
      local size_mb = stats.size / (1024 * 1024)

      -- For files larger than 1MB, disable some features
      if size_mb > 1 then
        vim.b[buf].large_file = true
        vim.opt_local.foldmethod = 'manual'
        vim.opt_local.spell = false
        vim.opt_local.swapfile = false
        vim.opt_local.undofile = false
        vim.opt_local.breakindent = false
        vim.opt_local.colorcolumn = ''
        vim.opt_local.statuscolumn = ''
        vim.opt_local.signcolumn = 'no'
      end
    end
  end,
})

-- Disable cursorline in insert mode for better performance
vim.api.nvim_create_autocmd('InsertEnter', {
  group = perf_augroup,
  pattern = '*',
  callback = function()
    vim.opt.cursorline = false
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = perf_augroup,
  pattern = '*',
  callback = function()
    vim.opt.cursorline = true
  end,
})
