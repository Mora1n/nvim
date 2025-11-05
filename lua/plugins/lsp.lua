return {
  {
    'saghen/blink.cmp',
    optional = true,
    opts = function(_, opts)
      -- Ensure blink.cmp is loaded before LSP
      return opts
    end,
  },
  {
    -- Native LSP configuration without nvim-lspconfig
    name = 'native-lsp',
    dir = vim.fn.stdpath('config'),
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Load LSP configurations from lsp/ directory
      local lsp_dir = vim.fn.stdpath('config') .. '/lsp'

      -- Get LSP capabilities from blink.cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, 'blink.cmp') then
        capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
      end

      -- Helper function to find root directory
      local function find_root(markers)
        return function(fname)
          local util = vim.fs
          return util.root(fname, markers)
        end
      end

      -- Load ty.lua for Python LSP
      local ty_config = dofile(lsp_dir .. '/ty.lua')
      if ty_config and vim.fn.executable('ty') == 1 then
        -- Configure ty language server
        vim.lsp.config('ty', {
          cmd = ty_config.cmd,
          filetypes = ty_config.filetypes,
          root_dir = find_root(ty_config.root_markers),
          capabilities = capabilities,
          settings = {
            ty = {
              -- ty language server settings go here
            }
          },
          on_attach = function(client, bufnr)
            -- LSP keymaps for ty
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>f', function()
              vim.lsp.buf.format({ async = true })
            end, opts)

            -- Highlight references under cursor
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
          end,
        })

        -- Enable the language server
        -- Note: vim.lsp.enable('ty') should work according to docs, but we use
        -- vim.lsp.start as a reliable implementation for Neovim 0.11.4
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'python',
          callback = function(args)
            local root = find_root(ty_config.root_markers)(vim.api.nvim_buf_get_name(args.buf))
            if root then
              vim.lsp.start({
                name = 'ty',
                cmd = ty_config.cmd,
                root_dir = root,
                capabilities = capabilities,
              })
            end
          end,
        })
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = '●',
          source = 'if_many',
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      })

      -- Diagnostic signs
      local signs = {
        Error = ' ',
        Warn = ' ',
        Hint = ' ',
        Info = ' ',
      }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
