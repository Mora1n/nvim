local utils = require('config.utils')

return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = 'FzfLua',
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Live grep' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Find buffers' },
    { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = 'Grep word under cursor' },
    { '<leader>fr', '<cmd>FzfLua resume<cr>', desc = 'Resume last search' },
    { '<leader>f/', '<cmd>FzfLua lgrep_curbuf<cr>', desc = 'Search in current buffer' },
    { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help tags' },
  },
  enabled = utils.not_vscode,
  opts = {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        default = 'builtin',
        border = 'border',
        wrap = 'nowrap',
        hidden = 'nohidden',
        vertical = 'down:45%',
        horizontal = 'right:60%',
        layout = 'flex',
      },
    },
  },
}
