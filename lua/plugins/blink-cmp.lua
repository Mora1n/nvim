return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  event = 'InsertEnter',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        border = 'rounded',
        draw = {
          treesitter = { 'lsp' },
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
            max_sync_buffer_size = 20000,
            max_async_buffer_size = 200000,
            max_total_buffer_size = 500000,
          },
        },
      },
    },

    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      frecency = {
        enabled = true,
      },
      use_proximity = true,
    },
  },
}
