return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  enabled = vim.g.vscode == nil,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'go',
        'gomod',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'rust',
        'toml',
        'typescript',
        'vimdoc',
        'vue',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
          -- Disable for large files (consistent with autocmds.lua)
          local max_filesize = 1024 * 1024 -- 1 MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
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
      indent = {
        enable = true,
        disable = {},
      },
    })

    require('treesitter-context').setup({
      enable = true,
      max_lines = 3,
      trim_scope = 'outer',
      mode = 'cursor',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'python',
      callback = function()
        vim.opt_local.smartindent = false
        vim.opt_local.cindent = false
      end,
    })
  end,
}
