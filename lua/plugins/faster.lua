return {
  'pteroctopus/faster.nvim',
  lazy = false,
  opts = {
    behaviours = {
      bigfile = {
        on = true,
        features_disabled = { 'filetype', 'lsp', 'matchparen', 'syntax', 'treesitter', 'vimopts' },
        filesize = 1, -- 1 MiB
      },
      fastmacro = {
        on = true,
        features_disabled = { 'lualine' },
      },
    },
    features = {
      filetype = { on = true, defer = true },
      lsp = { on = true, defer = false },
      lualine = { on = true, defer = false },
      matchparen = { on = true, defer = false },
      syntax = { on = true, defer = true },
      treesitter = { on = true, defer = false },
      vimopts = { on = true, defer = false },
    },
  },
}
