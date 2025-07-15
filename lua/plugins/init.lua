return {
  -- Status line
  {
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
  },

  -- Toggle between relative and absolute line numbers
  'jeffkreeftmeijer/vim-numbertoggle',

  -- Support for .editorconfig files
  'editorconfig/editorconfig-vim',

  -- Smart auto-pairing of delimiters
  'raimondi/delimitmate',

  -- Auto-add 'end' in certain filetypes
  'tpope/vim-endwise',

  -- Auto-detect indentation settings
  'tpope/vim-sleuth',

  -- Quickly change surrounding characters
  'tpope/vim-surround',

  -- Comprehensive syntax & indent support
  'sheerun/vim-polyglot',

  -- Dracula theme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'dracula'
    end,
  },
}
