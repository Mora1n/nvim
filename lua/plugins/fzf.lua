return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    require('fzf-lua').setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          default = 'builtin', -- Use Neovim's built-in preview (fallback to cat if bat not found)
          border = 'border',
          wrap = 'nowrap',
          hidden = 'nohidden',
          vertical = 'down:45%',
          horizontal = 'right:60%',
          layout = 'flex',
        },
      },
    })

    -- Key mappings
    -- Core functionality (most used)
    vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua live_grep<cr>', { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fo', '<cmd>FzfLua oldfiles<cr>', { desc = 'Recent files' })

    -- Enhanced search functionality
    vim.keymap.set('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>', { desc = 'Grep word under cursor' })
    vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = 'Resume last search' })
    vim.keymap.set('n', '<leader>f/', '<cmd>FzfLua lgrep_curbuf<cr>', { desc = 'Search in current buffer' })

    -- Help
    vim.keymap.set('n', '<leader>fh', '<cmd>FzfLua help_tags<cr>', { desc = 'Help tags' })
  end,
}
