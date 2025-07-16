return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = not vim.g.vscode,
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      }
    })
  end,
}
