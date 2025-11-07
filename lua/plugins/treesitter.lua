local utils = require('config.utils')

return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-context' },
  build = ':TSUpdate',
  event = utils.events.file,
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  enabled = utils.not_vscode,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash', 'c', 'cpp', 'css', 'go', 'gomod', 'html',
        'javascript', 'json', 'jsonc', 'lua', 'make',
        'markdown', 'markdown_inline', 'python', 'rust',
        'toml', 'typescript', 'vimdoc', 'vue', 'yaml',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 1024 * 1024 -- 1 MB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
      },
      indent = { enable = true },
    })

    require('treesitter-context').setup({
      max_lines = 3,
      trim_scope = 'outer',
      mode = 'cursor',
    })

    -- Disable smartindent for Python (treesitter handles it)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      callback = function()
        vim.opt_local.smartindent = false
        vim.opt_local.cindent = false
      end,
    })
  end,
}
