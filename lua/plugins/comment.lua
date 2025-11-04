return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('Comment').setup({
      -- 基础配置
      padding = true,   -- 注释符号和文本之间添加空格
      sticky = true,    -- 光标保持在原位置
      ignore = '^$',    -- 忽略空行

      -- 切换映射
      toggler = {
        line = 'gcc',   -- 行注释切换
        block = 'gbc',  -- 块注释切换
      },

      -- 操作映射
      opleader = {
        line = 'gc',    -- 行注释操作
        block = 'gb',   -- 块注释操作
      },

      -- 额外映射
      extra = {
        above = 'gcO',  -- 在上方添加注释
        below = 'gco',  -- 在下方添加注释
        eol = 'gcA',    -- 在行尾添加注释
      },

      -- 启用所有模式的映射
      mappings = {
        basic = true,
        extra = true,
      },
    })

    -- 自定义 Ctrl+/ 快捷键
    local api = require('Comment.api')

    -- Normal 模式：Ctrl+/ 注释当前行
    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment line' })

    -- Visual 模式：Ctrl+/ 注释选中的行
    vim.keymap.set('x', '<C-_>', function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment selection' })

    -- Insert 模式：Ctrl+/ 注释当前行
    vim.keymap.set('i', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment line' })
  end,
}
