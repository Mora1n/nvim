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

  -- Modern syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'typescript', 'html', 'css' },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- Support for .editorconfig files
  'gpanders/editorconfig.nvim',

  -- Smart auto-pairing of delimiters
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- uses default configuration
  },

  -- Auto-detect indentation settings
  'tpope/vim-sleuth',

  -- Quickly change surrounding characters
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; avoids breaking changes
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration options go here
      })
    end,
  },

  -- Dracula theme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'dracula'
    end,
  },
}