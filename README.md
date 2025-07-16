# Neovim Configuration

This is a personal Neovim configuration focused on providing a modern and efficient editing experience.

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Mora1n/nvim-config.git ~/.config/nvim
    ```

2.  **Start Neovim:**

    Open Neovim. The plugin manager, [lazy.nvim](https://github.com/folke/lazy.nvim), will automatically install all the declared plugins.

## Features

-   **Plugin Manager:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and easy plugin management.
-   **Modern UI:**
    -   [dracula.nvim](https://github.com/Mofiqul/dracula.nvim) theme for a pleasant look.
    -   [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for a clean and informative status line.
-   **Enhanced Editing:**
    -   [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for advanced syntax highlighting.
    -   [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for smart auto-pairing of delimiters.
    -   [nvim-surround](https://github.com/kylechui/nvim-surround) for quickly changing surrounding characters.
    -   Automatic detection of indentation settings per file with [vim-sleuth](https://github.com/tpope/vim-sleuth).
    -   Support for `.editorconfig` files with [editorconfig.nvim](https://github.com/gpanders/editorconfig.nvim).
-   **Sensible Defaults:**
    -   `<Space>` is the leader key.
    -   System clipboard integration.
    -   Persistent undo history.
    -   Improved search and split behavior.
    -   Standardized indentation (4 spaces).

## Plugins

This configuration uses the following plugins:

-   **[lazy.nvim](https://github.com/folke/lazy.nvim)**: A modern plugin manager for Neovim.
-   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A sleek and customizable status line.
-   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting.
-   **[editorconfig.nvim](https://github.com/gpanders/editorconfig.nvim)**: Support for `.editorconfig` files.
-   **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Smart auto-pairing for delimiters.
-   **[vim-sleuth](https://github.com/tpope/vim-sleuth)**: Heuristically detects indentation settings.
-   **[nvim-surround](https://github.com/kylechui/nvim-surround)**: Tools for changing surrounding delimiters.
-   **[dracula.nvim](https://github.com/Mofiqul/dracula.nvim)**: The color scheme for this configuration.
