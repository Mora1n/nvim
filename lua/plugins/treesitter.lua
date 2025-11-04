return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
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
        'latex',
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
          -- Disable for large files
          local max_filesize = 100 * 1024 -- 100 KB
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
      },
    })
  end,
}
