return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')

    wk.setup({
      preset = 'modern',
      delay = 500, -- delay before showing the popup (ms)
      icons = {
        breadcrumb = '»', -- symbol used in the command line area
        separator = '➜', -- symbol used between a key and its label
        group = '+', -- symbol prepended to a group
      },
      win = {
        border = 'rounded', -- none, single, double, shadow, rounded
        padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      },
    })

    -- Document existing key chains
    wk.add({
      -- Find group (FzfLua)
      { '<leader>f', group = 'Find' },
      { '<leader>ff', desc = 'Find files' },
      { '<leader>fg', desc = 'Live grep' },
      { '<leader>fb', desc = 'Find buffers' },
      { '<leader>fo', desc = 'Recent files' },
      { '<leader>fw', desc = 'Grep word under cursor' },
      { '<leader>fr', desc = 'Resume last search' },
      { '<leader>f/', desc = 'Search in current buffer' },
      { '<leader>fh', desc = 'Help tags' },

      -- Buffer management
      { '<leader>b', group = 'Buffer' },
      { '<leader>bd', desc = 'Delete buffer' },
      { '<leader>bD', desc = 'Delete buffer (force)' },
      { '<leader>ba', desc = 'Delete all buffers' },
      { '<leader>bo', desc = 'Delete other buffers' },
      { '<S-h>', desc = 'Previous buffer' },
      { '<S-l>', desc = 'Next buffer' },

      -- LSP
      { '<leader>c', group = 'Code' },
      { '<leader>ca', desc = 'Code action' },
      { '<leader>rn', desc = 'Rename' },
      { 'gd', desc = 'Go to definition' },
      { 'gD', desc = 'Go to declaration' },
      { 'gr', desc = 'Go to references' },
      { 'gi', desc = 'Go to implementation' },
      { 'K', desc = 'Hover documentation' },

      -- Diagnostics
      { '<leader>x', group = 'Diagnostics' },
      { '<leader>xl', desc = 'Open diagnostic list' },
      { '<leader>e', desc = 'Show diagnostic error' },
      { '[d', desc = 'Previous diagnostic' },
      { ']d', desc = 'Next diagnostic' },

      -- Quit
      { '<leader>q', desc = 'Quit' },
      { '<leader>Q', desc = 'Quit all without saving' },

      -- Paste/Delete special
      { '<leader>p', desc = 'Paste without yanking', mode = 'x' },
      { '<leader>d', desc = 'Delete without yanking', mode = { 'n', 'v' } },

      -- Comment keybindings
      { 'gc', group = 'Comment' },
      { 'gcc', desc = 'Toggle comment line' },
      { 'gbc', desc = 'Toggle block comment' },
      { 'gcO', desc = 'Comment above' },
      { 'gco', desc = 'Comment below' },
      { 'gcA', desc = 'Comment end of line' },
      { '<C-_>', desc = 'Toggle comment (Ctrl+/)' },

      -- Window navigation (Ctrl+hjkl)
      { '<C-h>', desc = 'Move to left window' },
      { '<C-j>', desc = 'Move to bottom window' },
      { '<C-k>', desc = 'Move to top window' },
      { '<C-l>', desc = 'Move to right window' },

      -- Window resize (Ctrl+arrows)
      { '<C-Up>', desc = 'Increase window height' },
      { '<C-Down>', desc = 'Decrease window height' },
      { '<C-Left>', desc = 'Decrease window width' },
      { '<C-Right>', desc = 'Increase window width' },

      -- Scrolling (keep centered)
      { '<C-d>', desc = 'Scroll down and center' },
      { '<C-u>', desc = 'Scroll up and center' },
      { 'n', desc = 'Next search result and center' },
      { 'N', desc = 'Previous search result and center' },

      -- Save
      { '<C-s>', desc = 'Save file', mode = { 'n', 'i' } },

      -- Clear search highlight
      { '<Esc>', desc = 'Clear search highlight' },

      -- Visual mode
      { '<', desc = 'Indent left and reselect', mode = 'v' },
      { '>', desc = 'Indent right and reselect', mode = 'v' },
      { 'J', desc = 'Move selection down', mode = 'v' },
      { 'K', desc = 'Move selection up', mode = 'v' },
    })
  end,
}
