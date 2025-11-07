local utils = require('config.utils')

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = utils.events.lazy,
  enabled = utils.not_vscode,
  opts = {
    options = {
      theme = 'dracula',
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}
