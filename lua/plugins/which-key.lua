local utils = require('config.utils')

return {
  'folke/which-key.nvim',
  event = utils.events.lazy,
  opts = {
    preset = 'modern',
    delay = 500,
    icons = {
      breadcrumb = '»',
      separator = '➜',
      group = '+',
    },
    win = {
      border = utils.border,
      padding = { 1, 2 },
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

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

      -- Window management
      { '<leader>w', group = 'Window' },
      { '<leader>wv', desc = 'Split vertically' },
      { '<leader>ws', desc = 'Split horizontally' },
      { '<leader>wc', desc = 'Close window' },
      { '<leader>wo', desc = 'Close other windows' },
      { '<leader>w=', desc = 'Equalize sizes' },

      -- LSP
      { '<leader>c', group = 'Code' },
      { '<leader>ca', desc = 'Code action' },
      { '<leader>cf', desc = 'Format' },
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

      -- Yank/Clipboard operations
      { '<leader>y', desc = 'Yank to clipboard', mode = { 'n', 'v' } },
      { '<leader>Y', desc = 'Yank line to clipboard' },

      -- Paste/Delete special
      { '<leader>p', desc = 'Paste without yanking', mode = 'x' },
      { '<leader>d', desc = 'Delete without yanking', mode = { 'n', 'v' } },

      -- Line operations
      { '<leader>o', desc = 'Insert blank line below' },
      { '<leader>O', desc = 'Insert blank line above' },
      { 'J', desc = 'Join lines (keep cursor)' },

      -- Quit
      { '<leader>q', desc = 'Quit' },
      { '<leader>Q', desc = 'Quit all without saving' },

      -- Comment keybindings (Comment.nvim)
      { 'gc', group = 'Comment' },
      { 'gcc', desc = 'Toggle comment line' },
      { 'gbc', desc = 'Toggle block comment' },
      { 'gb', desc = 'Block comment operator', mode = { 'n', 'v' } },
      { 'gcO', desc = 'Comment above' },
      { 'gco', desc = 'Comment below' },
      { 'gcA', desc = 'Comment end of line' },
      { '<C-_>', desc = 'Toggle comment (Ctrl+/)', mode = { 'n', 'x', 'i' } },

      -- Window navigation (Ctrl+hjkl)
      { '<C-h>', desc = 'Move to left window' },
      { '<C-j>', desc = 'Move to bottom window' },
      { '<C-k>', desc = 'Move to top window' },
      { '<C-l>', desc = 'Clear highlight and move right' },

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

      -- Visual mode
      { '<', desc = 'Indent left and reselect', mode = 'v' },
      { '>', desc = 'Indent right and reselect', mode = 'v' },
      { 'J', desc = 'Move selection down', mode = 'v' },
      { 'K', desc = 'Move selection up', mode = 'v' },

      -- Clipboard operations (visual mode)
      { '<C-c>', desc = 'Copy to clipboard', mode = 'v' },
      { '<C-x>', desc = 'Cut to clipboard', mode = 'v' },

      -- Insert mode
      { '<C-a>', desc = 'Select all', mode = 'i' },
      { '<C-z>', desc = 'Undo', mode = 'i' },
      { '<C-v>', desc = 'Paste from clipboard', mode = { 'i', 'n' } },
      { '<C-BS>', desc = 'Delete word backward', mode = 'i' },

      -- Select mode
      { '<BS>', desc = 'Delete selection and insert', mode = 's' },

      -- Flash.nvim keybindings
      { 's', desc = 'Flash jump', mode = { 'n', 'x', 'o' } },
      { 'S', desc = 'Flash Treesitter', mode = { 'n', 'x', 'o' } },
      { 'r', desc = 'Remote Flash', mode = 'o' },
      { 'R', desc = 'Treesitter Search', mode = { 'o', 'x' } },
      { '<c-s>', desc = 'Toggle Flash Search', mode = 'c' },

      -- Treesitter incremental selection
      { '<CR>', desc = 'Init/Increment selection', mode = { 'n', 'v' } },
      { '<TAB>', desc = 'Increment scope', mode = 'v' },
      { '<S-TAB>', desc = 'Decrement node', mode = 'v' },

      -- Surround.nvim keybindings (nvim-surround default mappings)
      { 'ys', desc = 'Add surround', mode = 'n' },
      { 'yss', desc = 'Add surround to line', mode = 'n' },
      { 'yS', desc = 'Add surround on new lines', mode = 'n' },
      { 'ySS', desc = 'Add surround to line on new lines', mode = 'n' },
      { 'ds', desc = 'Delete surround', mode = 'n' },
      { 'cs', desc = 'Change surround', mode = 'n' },
      { 'S', desc = 'Add surround', mode = 'v' },
      { 'gS', desc = 'Add surround on new lines', mode = 'v' },
    })
  end,
}
