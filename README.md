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

*   **[blink.cmp](https://github.com/saghen/blink.cmp):** Performant completion plugin with Rust fuzzy matching.
    *   Sources: LSP, path, snippets, buffer
    *   Auto-show documentation with 200ms delay
    *   Signature help enabled
*   **Native LSP:** Uses Neovim's built-in LSP without nvim-lspconfig.
    *   `gd`: Go to definition
    *   `gD`: Go to declaration
    *   `gr`: References
    *   `gi`: Implementation
    *   `K`: Hover documentation
    *   `<leader>rn`: Rename
    *   `<leader>ca`: Code actions
    *   `<leader>f`: Format

### Editor

*   **[autopairs.nvim](https://github.com/windwp/nvim-autopairs):** Inserts or deletes brackets, parens, quotes in pair.
*   **[flash.nvim](https://github.com/folke/flash.nvim):** Enhanced jump motions for Neovim.
    *   `s`: Flash jump
    *   `S`: Flash Treesitter
    *   `r`: Remote Flash (operator pending mode)
    *   `R`: Treesitter Search (operator pending and visual mode)
    *   `<c-s>`: Toggle Flash Search (command-line mode)
*   **[vim-sleuth](https://github.com/tpope/vim-sleuth):** Heuristically set `shiftwidth` and `expandtab` based on the current file.
*   **[nvim-surround](https://github.com/kylechui/nvim-surround):** Add/change/delete surrounding pairs of characters.
*   **[editorconfig.nvim](https://github.com/gpanders/editorconfig.nvim):** EditorConfig support for Neovim.

### UI

*   **[dracula.nvim](https://github.com/Mofiqul/dracula.nvim):** Dracula colorscheme with transparent background.
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A blazing fast and easy to configure statusline with global statusline enabled.

### Syntax

*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Provides syntax highlighting, indentation, and incremental selection using Treesitter.
    *   **Installed parsers:** `c`, `lua`, `vim`, `vimdoc`, `query`, `python`, `javascript`, `typescript`, `html`, `css`, `json`, `markdown`, `markdown_inline`.
    *   Automatic disable for files >100KB

### Performance

*   **[faster.nvim](https://github.com/pteroctopus/faster.nvim):** Automatically disables heavy features for big files (>2MB).
    *   Disables: LSP, treesitter, syntax, matchparen for large files
    *   Fast macro execution mode
*   **[vim-startuptime](https://github.com/dstein64/vim-startuptime):** Analyze startup performance with `:StartupTime`.
*   **[nvim-bufdel](https://github.com/ojroques/nvim-bufdel):** Optimized buffer deletion.
    *   `<leader>bd`: Delete buffer
    *   `<leader>bD`: Delete buffer (force)
    *   `<leader>ba`: Delete all buffers
    *   `<leader>bo`: Delete other buffers

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