return {
  'pteroctopus/faster.nvim',
  lazy = false,
  opts = {
    behaviours = {
      -- Automatically disable heavy features for big files (>1MB, consistent with other configs)
      bigfile = {
        on = true,
        features_disabled = {
          'filetype',
          'lsp',
          'matchparen',
          'syntax',
          'treesitter',
          'vimopts',
        },
        filesize = 1, -- size in MiB (consistent with autocmds.lua and treesitter.lua)
      },
      -- Speed up macro execution by disabling statusline updates
      fastmacro = {
        on = true,
        features_disabled = { 'lualine' },
      },
    },
    features = {
      -- Neovim filetype plugin
      filetype = {
        on = true,
        defer = true,
      },
      -- Neovim LSP
      lsp = {
        on = true,
        defer = false,
      },
      -- Lualine
      lualine = {
        on = true,
        defer = false,
      },
      -- Neovim matchparen plugin
      matchparen = {
        on = true,
        defer = false,
      },
      -- Neovim syntax
      syntax = {
        on = true,
        defer = true,
      },
      -- Neovim treesitter
      treesitter = {
        on = true,
        defer = false,
      },
      -- Vim options that affect speed: swapfile, foldmethod, undolevels, undoreload, list
      vimopts = {
        on = true,
        defer = false,
      },
    },
  },
}
