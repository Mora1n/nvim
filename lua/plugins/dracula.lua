return {
  'Mofiqul/dracula.nvim',
  priority = 1000,
  opts = {
    transparent_bg = true,
    show_end_of_buffer = true,
  },
  config = function(_, opts)
    require('dracula').setup(opts)
    vim.cmd.colorscheme 'dracula'

    -- Additional transparency settings
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
  end,
}
