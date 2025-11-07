local utils = require('config.utils')

return {
  'kylechui/nvim-surround',
  version = '*',
  keys = {
    { 'ys', mode = 'n', desc = 'Add surround' },
    { 'ds', mode = 'n', desc = 'Delete surround' },
    { 'cs', mode = 'n', desc = 'Change surround' },
    { 'S', mode = 'v', desc = 'Add surround' },
  },
  opts = {},
}
