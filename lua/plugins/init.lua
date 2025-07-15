return {
  -- Status line
  {
    'vim-airline/vim-airline',
    config = function()
      vim.g.airline_theme = 'dracula_pro'
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

  -- Dracula Pro theme
  {
    'Mora1n/vim-dracula-pro',
    as = 'dracula_pro',
    config = function()
      vim.cmd.colorscheme 'dracula_pro'
    end,
  },
}
