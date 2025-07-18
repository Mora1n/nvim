# Neovim Configuration

This is a Neovim configuration based on Lua. It uses `lazy.nvim` for plugin management.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository_url> ~/.config/nvim
    ```

2.  **Install `lazy.nvim`:**
    The configuration will automatically install `lazy.nvim` on the first run.

## Leader Key

The leader key is set to `<Space>`.

## Plugins

This configuration uses the following plugins:

*   **[autopairs.nvim](https://github.com/windwp/nvim-autopairs):** Inserts or deletes brackets, parens, quotes in pair.
*   **[dracula.nvim](https://github.com/Mofiqul/dracula.nvim):** Dracula colorscheme.
*   **[editorconfig.nvim](https://github.com/gpanders/editorconfig.nvim):** EditorConfig support for Neovim.
*   **[flash.nvim](https://github.com/folke/flash.nvim):** Enhanced jump motions for Neovim.
    *   `s`: Flash jump
    *   `S`: Flash Treesitter
    *   `r`: Remote Flash (operator pending mode)
    *   `R`: Treesitter Search (operator pending and visual mode)
    *   `<c-s>`: Toggle Flash Search (command-line mode)
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A blazing fast and easy to configure statusline.
*   **[vim-sleuth](https://github.com/tpope/vim-sleuth):** Heuristically set `shiftwidth` and `expandtab` based on the current file.
*   **[nvim-surround](https://github.com/kylechui/nvim-surround):** Add/change/delete surrounding pairs of characters.
*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Provides syntax highlighting, indentation, and more using Treesitter.
    *   **Installed parsers:** `c`, `lua`, `vim`, `vimdoc`, `query`, `javascript`, `typescript`, `html`, `css`.

## Options

The following options are set in `lua/config/options.lua`:

*   Line numbers and relative line numbers are enabled.
*   Mouse mode is enabled.
*   Clipboard is synced with the OS.
*   Undo history is saved.
*   Case-insensitive searching.
*   and more...

## Autocmds

The following autocmds are set in `lua/config/autocmds.lua`:

*   Toggle relative numbers on entering and leaving insert mode.