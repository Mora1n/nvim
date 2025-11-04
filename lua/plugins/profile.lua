return {
  -- Startup time profiler
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- Lazy.nvim profiler integration
  {
    'folke/lazy.nvim',
    opts = {
      profiling = {
        -- Enables extra stats on the debug tab related to the loader cache.
        -- Additionally gathers stats about all package.loaders
        loader = true,
        -- Track each new require in the Lazy profiling tab
        require = true,
      },
    },
  },
}
