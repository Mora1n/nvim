local utils = require('config.utils')

return {
  'windwp/nvim-autopairs',
  event = utils.events.insert,
  enabled = utils.not_vscode,
  opts = {},
}
