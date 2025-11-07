local utils = require('config.utils')

return {
  'numToStr/Comment.nvim',
  keys = {
    { 'gcc', mode = 'n', desc = 'Toggle comment line' },
    { 'gbc', mode = 'n', desc = 'Toggle block comment' },
    { 'gc', mode = { 'n', 'v' }, desc = 'Comment operator' },
    { 'gb', mode = { 'n', 'v' }, desc = 'Block comment operator' },
    { '<C-_>', mode = { 'n', 'i', 'x' }, desc = 'Toggle comment (Ctrl+/)' },
  },
  opts = {
    padding = true,
    sticky = true,
    ignore = '^$',
    toggler = { line = 'gcc', block = 'gbc' },
    opleader = { line = 'gc', block = 'gb' },
    extra = { above = 'gcO', below = 'gco', eol = 'gcA' },
    mappings = { basic = true, extra = true },
  },
  config = function(_, opts)
    require('Comment').setup(opts)

    -- Custom Ctrl+/ keybindings
    local api = require('Comment.api')
    vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, { desc = 'Toggle comment line' })
    vim.keymap.set('x', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment selection' })
    vim.keymap.set('i', '<C-_>', api.toggle.linewise.current, { desc = 'Toggle comment line' })
  end,
}
