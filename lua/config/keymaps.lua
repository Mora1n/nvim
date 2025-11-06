-- [[ Basic Keymaps ]]

-- Detect VSCode environment
local is_vscode = vim.g.vscode ~= nil

-- ============================================================================
-- Normal Mode Keymaps
-- ============================================================================

-- Keep cursor centered when scrolling and searching
if is_vscode then
  -- VSCode: Use simple search navigation to avoid highlight rendering issues
  vim.keymap.set('n', 'n', 'n', { desc = 'Next search result' })
  vim.keymap.set('n', 'N', 'N', { desc = 'Previous search result' })
  vim.keymap.set('n', '<C-d>', '<C-d>', { desc = 'Scroll down' })
  vim.keymap.set('n', '<C-u>', '<C-u>', { desc = 'Scroll up' })
else
  -- Neovim: Keep cursor centered for better visibility
  vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
  vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
  vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
  vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })
end

-- Better line joining (keep cursor position)
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

-- Quick line operations
vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = 'Insert blank line below' })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = 'Insert blank line above' })

-- Better paste (don't yank replaced text)
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yanking' })

-- Delete without yanking
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard' })

if not is_vscode then
  -- Window management
  -- Resize windows with arrows
  vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
  vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
  vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
  vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

  -- Split windows
  vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'Split window vertically' })
  vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'Split window horizontally' })
  vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc = 'Close current window' })
  vim.keymap.set('n', '<leader>wo', ':only<CR>', { desc = 'Close other windows' })
  vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize window sizes' })

  -- Buffer navigation
  vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Previous buffer' })
  vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })

  -- Save file
  vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
  vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save file' })

  -- Quit
  vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
  vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = 'Quit all without saving' })

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error' })
  vim.keymap.set('n', '<leader>xl', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
end

-- ============================================================================
-- Visual Mode Keymaps
-- ============================================================================

-- Better indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Move text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

if not is_vscode then
  -- Clipboard operations
  vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to clipboard' })
  vim.keymap.set('v', '<C-x>', '"+d', { desc = 'Cut to clipboard' })
end

-- ============================================================================
-- Insert Mode Keymaps
-- ============================================================================

if not is_vscode then
  -- Insert mode navigation and selection
  vim.keymap.set('i', '<Home>', '<C-o>^')
  vim.keymap.set('i', '<End>', '<C-o>$')
  vim.keymap.set('i', '<S-Home>', '<Esc>v^')
  vim.keymap.set('i', '<S-End>', '<Esc>v$')
  vim.keymap.set('i', '<S-Left>', '<Esc>vh')
  vim.keymap.set('i', '<S-Right>', '<Esc>vl')
  vim.keymap.set('i', '<C-Left>', '<C-o>b')
  vim.keymap.set('i', '<C-Right>', '<C-o>w')
  vim.keymap.set('i', '<C-S-Left>', '<Esc>vb')
  vim.keymap.set('i', '<C-S-Right>', '<Esc>vw')
  vim.keymap.set('i', '<C-BS>', '<C-w>')

  -- Insert mode editing shortcuts
  vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { desc = 'Select all' })
  vim.keymap.set('i', '<C-z>', '<C-o>u', { desc = 'Undo' })
  vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })

  -- Normal mode paste
  vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste from clipboard' })
end

-- ============================================================================
-- Select Mode Keymaps
-- ============================================================================

if not is_vscode then
  -- Select mode behavior
  vim.keymap.set('s', '<BS>', '<BS>i', { desc = 'Delete selection and enter insert' })
  vim.keymap.set('s', '<C-h>', '<BS>i')
end
