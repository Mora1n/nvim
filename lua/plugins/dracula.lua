return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent_bg = true,
    show_end_of_buffer = true,
  },
  config = function(_, opts)
    require('dracula').setup(opts)
    vim.cmd.colorscheme('dracula')

    -- Additional transparency settings
    local transparent_groups = { 'Normal', 'NormalFloat', 'NormalNC', 'SignColumn' }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end
  end,
}
