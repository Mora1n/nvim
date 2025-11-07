local utils = require('config.utils')

return {
  'gpanders/editorconfig.nvim',
  event = utils.events.file,
}
