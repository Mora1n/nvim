# Neovim Configuration

A highly optimized Neovim configuration based on Lua with native LSP support, modern completion, and extensive performance optimizations. Uses `lazy.nvim` for plugin management.

## Features

- 🚀 **High Performance** - Optimized for fast startup (<50ms) and smooth editing
- 🎨 **Transparent Background** - Beautiful Dracula theme with transparency
- 💡 **Native LSP** - Uses `vim.lsp.config` and `vim.lsp.enable` (Neovim 0.11+)
- ⚡ **Blink.cmp** - Rust-powered completion engine for superior performance
- 📦 **Modular LSP** - LSP configurations in separate `lsp/` directory
- 🔍 **Smart File Handling** - Automatic optimization for large files (>2MB)
- 📊 **Profiling Tools** - Built-in startup time analysis

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository_url> ~/.config/nvim
    ```

2.  **Install dependencies:**
    - Neovim 0.11+ (for native LSP support)
    - A Nerd Font (for icons)
    - `ty` LSP server for Python (optional)

3.  **First run:**
    The configuration will automatically install `lazy.nvim` and all plugins on the first run.

## Leader Key

The leader key is set to `<Space>`.

## Plugins

### Completion & LSP

*   **[blink.cmp](https://github.com/saghen/blink.cmp):** Rust-powered completion engine.
*   **Native LSP:** Uses Neovim's built-in LSP without nvim-lspconfig.

### Navigation & Search

*   **[fzf-lua](https://github.com/ibhagwan/fzf-lua):** Fuzzy finder for files, buffers, and grep.
    *   `<leader>ff`: Find files
    *   `<leader>fg`: Live grep
    *   `<leader>fb`: Find buffers
    *   `<leader>fo`: Recent files
    *   `<leader>fw`: Grep word under cursor
    *   `<leader>fr`: Resume last search
    *   `<leader>f/`: Search in current buffer
    *   `<leader>fh`: Help tags
*   **[flash.nvim](https://github.com/folke/flash.nvim):** Enhanced jump motions.
*   **[which-key.nvim](https://github.com/folke/which-key.nvim):** Keybinding helper popup.

### Editor

*   **[autopairs.nvim](https://github.com/windwp/nvim-autopairs):** Auto-close brackets and quotes.
*   **[Comment.nvim](https://github.com/numToStr/Comment.nvim):** Smart commenting with `gcc`, `gbc`, `Ctrl+/`.
*   **[nvim-surround](https://github.com/kylechui/nvim-surround):** Manage surrounding pairs.
*   **[vim-sleuth](https://github.com/tpope/vim-sleuth):** Auto-detect indentation.
*   **[vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent):** PEP8 indentation for Python.

### UI

*   **[alpha-nvim](https://github.com/goolord/alpha-nvim):** Dashboard with ASCII art.
*   **[dracula.nvim](https://github.com/Mofiqul/dracula.nvim):** Dracula colorscheme with transparency.
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** Fast statusline.

### Syntax

*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Syntax highlighting and parsing.
    *   **Parsers:** `bash`, `c`, `cpp`, `css`, `go`, `gomod`, `html`, `javascript`, `json`, `jsonc`, `lua`, `make`, `markdown`, `markdown_inline`, `python`, `rust`, `toml`, `typescript`, `vimdoc`, `vue`, `yaml`
    *   Auto-disable for files >100KB

### Performance

*   **[faster.nvim](https://github.com/pteroctopus/faster.nvim):** Auto-optimize for large files (>2MB).
*   **[vim-startuptime](https://github.com/dstein64/vim-startuptime):** Startup profiler (`:StartupTime`).
*   **[nvim-bufdel](https://github.com/ojroques/nvim-bufdel):** Optimized buffer deletion (`<leader>bd/bD/ba/bo`).

## LSP Configuration

LSP configurations are stored in the `lsp/` directory for easy management:

*   `lsp/ty.lua` - Python LSP using the `ty` language server

To add more LSP servers, create new files in the `lsp/` directory following the same pattern.

## Performance Optimizations

This configuration includes extensive performance optimizations:

*   **Early optimizations:** `vim.loader.enable()` for faster Lua module loading
*   **Disabled built-in plugins:** 20+ unnecessary plugins disabled
*   **Lazy loading:** All plugins load on-demand via events, commands, or keymaps
*   **Cache enabled:** 2-day TTL for lazy.nvim cache
*   **Large file handling:** Automatic feature disabling for files >1MB
*   **Global statusline:** Single statusline for all windows (faster)
*   **No swap/backup files:** Faster file operations
*   **Optimized autocmds:** Cursorline disabled in insert mode

### Benchmarking

```vim
:StartupTime          " Analyze startup time (10 trials)
:Lazy profile         " View plugin loading profile
```

## Options

The following options are set in `lua/config/options.lua`:

*   Line numbers and relative line numbers are enabled.
*   Mouse mode is enabled.
*   Clipboard is synced with the OS.
*   Undo history is saved.
*   Case-insensitive searching.
*   Global statusline (faster rendering).
*   No swap or backup files.
*   Optimized for performance (synmaxcol, redrawtime, etc.).

## Autocmds

The following autocmds are set in `lua/config/autocmds.lua`:

*   Toggle relative numbers on entering and leaving insert mode.
*   Large file detection and optimization (>1MB).
*   Cursorline disabled in insert mode for better performance.