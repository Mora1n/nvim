-- Shared utilities for plugin configuration
local M = {}

-- Common event groups for lazy loading
M.events = {
  file = { 'BufReadPre', 'BufNewFile' },
  insert = 'InsertEnter',
  lazy = 'VeryLazy',
  start = 'VimEnter',
}

-- Check if running in VSCode
M.not_vscode = vim.g.vscode == nil

-- Common border style
M.border = 'rounded'

-- LSP keymaps setup (reusable across LSP configs)
function M.setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>cf', function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- LSP document highlight setup (reusable)
function M.setup_lsp_highlight(client, bufnr)
  if client.supports_method('textDocument/documentHighlight') then
    local group = vim.api.nvim_create_augroup('lsp_document_highlight_' .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Root directory finder for LSP
function M.find_root(markers)
  return function(fname)
    return vim.fs.root(fname, markers)
  end
end

-- Get LSP capabilities with blink.cmp integration
function M.get_lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  if pcall(require, 'blink.cmp') then
    capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
  end
  return capabilities
end

return M
