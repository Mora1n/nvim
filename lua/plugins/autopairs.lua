return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  enabled = vim.g.vscode == nil,
  opts = {} -- uses default configuration
}
