return {
  -- Improve startup time by caching lua modules
  {
    'lewis6991/impatient.nvim',
    enabled = vim.fn.has('nvim-0.9') == 0, -- Only for Neovim < 0.9 (0.9+ has built-in loader)
    config = function()
      require('impatient')
    end,
  },

  -- Filetype detection optimization (already built into Neovim 0.8+)
  {
    'nathom/filetype.nvim',
    enabled = vim.fn.has('nvim-0.8') == 0, -- Only for Neovim < 0.8
    config = function()
      require('filetype').setup({
        overrides = {
          extensions = {
            py = 'python',
            lua = 'lua',
            js = 'javascript',
            ts = 'typescript',
          },
        },
      })
    end,
  },

  -- Optimize buffer deletion
  {
    'ojroques/nvim-bufdel',
    cmd = { 'BufDel', 'BufDelAll', 'BufDelOthers' },
    keys = {
      { '<leader>bd', '<cmd>BufDel<cr>', desc = 'Delete buffer' },
      { '<leader>bD', '<cmd>BufDel!<cr>', desc = 'Delete buffer (force)' },
      { '<leader>ba', '<cmd>BufDelAll<cr>', desc = 'Delete all buffers' },
      { '<leader>bo', '<cmd>BufDelOthers<cr>', desc = 'Delete other buffers' },
    },
    opts = {
      quit = false, -- Don't quit Neovim when deleting last buffer
    },
  },
}
