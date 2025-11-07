local utils = require('config.utils')

return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  event = utils.events.insert,
  enabled = utils.not_vscode,
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'super-tab',
      ['<Esc>'] = { 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        border = utils.border,
        draw = {
          treesitter = { 'lsp' },
          columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        buffer = {
          opts = {
            max_sync_buffer_size = 10000,
            max_async_buffer_size = 100000,
            max_total_buffer_size = 200000,
          },
        },
      },
    },
    signature = {
      enabled = true,
      window = { border = utils.border },
    },
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      frecency = { enabled = true },
      use_proximity = true,
    },
  },
}
