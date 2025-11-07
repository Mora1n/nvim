return {
  {
    'ojroques/nvim-bufdel',
    cmd = { 'BufDel', 'BufDelAll', 'BufDelOthers' },
    keys = {
      { '<leader>bd', '<cmd>BufDel<cr>', desc = 'Delete buffer' },
      { '<leader>bD', '<cmd>BufDel!<cr>', desc = 'Delete buffer (force)' },
      { '<leader>ba', '<cmd>BufDelAll<cr>', desc = 'Delete all buffers' },
      { '<leader>bo', '<cmd>BufDelOthers<cr>', desc = 'Delete other buffers' },
    },
    opts = { quit = false },
  },
}
