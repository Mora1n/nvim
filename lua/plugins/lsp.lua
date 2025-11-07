local utils = require('config.utils')

return {
  {
    'saghen/blink.cmp',
    optional = true,
  },
  {
    name = 'native-lsp',
    dir = vim.fn.stdpath('config'),
    event = utils.events.file,
    enabled = utils.not_vscode,
    config = function()
      local lsp_dir = vim.fn.stdpath('config') .. '/lsp'
      local capabilities = utils.get_lsp_capabilities()

      -- Load ty.lua for Python LSP
      local ty_config = dofile(lsp_dir .. '/ty.lua')
      if ty_config and vim.fn.executable('ty') == 1 then
        vim.lsp.config('ty', {
          cmd = ty_config.cmd,
          filetypes = ty_config.filetypes,
          root_dir = utils.find_root(ty_config.root_markers),
          capabilities = capabilities,
          flags = { debounce_text_changes = 150 },
          on_attach = function(client, bufnr)
            utils.setup_lsp_keymaps(bufnr)
            utils.setup_lsp_highlight(client, bufnr)
          end,
        })

        -- Auto-start LSP for Python files
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'python',
          callback = function(args)
            local root = utils.find_root(ty_config.root_markers)(vim.api.nvim_buf_get_name(args.buf))
            if root then
              vim.lsp.start({
                name = 'ty',
                cmd = ty_config.cmd,
                root_dir = root,
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
              })
            end
          end,
        })
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = { prefix = '●', source = 'if_many' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = utils.border, source = 'always' },
      })
    end,
  },
}
