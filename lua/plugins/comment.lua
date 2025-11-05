return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('Comment').setup({
      -- Basic configuration
      padding = true,   -- Add space between comment symbol and text
      sticky = true,    -- Keep cursor at its position
      ignore = '^$',    -- Ignore empty lines

      -- Toggle mappings
      toggler = {
        line = 'gcc',   -- Line comment toggle
        block = 'gbc',  -- Block comment toggle
      },

      -- Operator mappings
      opleader = {
        line = 'gc',    -- Line comment operator
        block = 'gb',   -- Block comment operator
      },

      -- Extra mappings
      extra = {
        above = 'gcO',  -- Add comment above
        below = 'gco',  -- Add comment below
        eol = 'gcA',    -- Add comment at end of line
      },

      -- Enable mappings for all modes
      mappings = {
        basic = true,
        extra = true,
      },
    })

    -- Custom Ctrl+/ keybindings
    local api = require('Comment.api')

    -- Normal mode: Ctrl+/ to toggle comment on current line
    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment line' })

    -- Visual mode: Ctrl+/ to toggle comment on selected lines
    vim.keymap.set('x', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment selection' })

    -- Insert mode: Ctrl+/ to toggle comment on current line
    vim.keymap.set('i', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment line' })
  end,
}
