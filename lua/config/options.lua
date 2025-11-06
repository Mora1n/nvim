-- [[ Setting options ]]
-- See `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type them
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Use spaces instead of tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indentation helpers
vim.opt.autoindent = true
-- vim.opt.smartindent = true  -- Disable smartindent and use Treesitter
vim.opt.copyindent = true

-- Other basic settings
vim.opt.encoding = 'utf-8'
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.wrap = true
vim.opt.backspace = 'indent,eol,start'

-- Set highlight on search
vim.opt.hlsearch = true

-- VSCode-specific settings to fix search highlight issues
if vim.g.vscode then
  -- Disable incremental search highlighting in VSCode to prevent rendering issues
  vim.opt.incsearch = false
  -- Use VSCode's native search highlighting
  vim.opt.hlsearch = false
end

-- True color support
vim.opt.termguicolors = true

-- Set dark background
vim.opt.background = 'dark'

-- Performance optimizations
vim.opt.laststatus = 3 -- Global statusline (faster)
vim.opt.swapfile = false -- No swap files
vim.opt.backup = false -- No backup files
vim.opt.writebackup = false -- No backup before overwriting

-- Additional performance settings
vim.opt.history = 1000 -- Limit command history
vim.opt.synmaxcol = 240 -- Max column for syntax highlight
vim.opt.redrawtime = 1500 -- Time in ms for redrawing
vim.opt.maxmempattern = 5000 -- Max memory for pattern matching

-- Additional optimizations
vim.opt.shadafile = "NONE"  
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.shadafile = ""
    vim.cmd("rshada")
  end,
})

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Faster completion
vim.opt.pumheight = 15 -- Popup menu height
vim.opt.pumblend = 0 -- Popup menu transparency

-- Faster file operations
vim.opt.fsync = false -- Don't fsync after write (faster but less safe)

