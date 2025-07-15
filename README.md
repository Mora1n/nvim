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
    -   [Dracula Pro](https://github.com/Mora1n/vim-dracula-pro) theme for a pleasant look.
    -   [vim-airline](https://github.com/vim-airline/vim-airline) for a clean and informative status line.
    -   Relative and absolute line numbers that toggle automatically.
-   **Enhanced Editing:**
    -   Smart auto-pairing of brackets, quotes, and other delimiters.
    -   Automatic detection of indentation settings per file.
    -   Comprehensive syntax highlighting for a wide variety of languages via [vim-polyglot](https://github.com/sheerun/vim-polyglot).
    -   Support for `.editorconfig` files.
-   **Sensible Defaults:**
    -   `<Space>` is the leader key.
    -   System clipboard integration.
    -   Persistent undo history.
    -   Improved search and split behavior.
    -   Standardized indentation (4 spaces).

## Plugins

This configuration uses the following plugins:

-   **[vim-airline](https://github.com/vim-airline/vim-airline)**: A sleek and customizable status line.
-   **[vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)**: Toggles between relative and absolute line numbers.
-   **[editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)**: Support for `.editorconfig` files.
-   **[delimitmate](https://github.com/raimondi/delimitmate)**: Provides smart auto-pairing for delimiters.
-   **[vim-endwise](https://github.com/tpope/vim-endwise)**: Automatically adds `end` in filetypes like Ruby, Lua, and Vim script.
-   **[vim-sleuth](https://github.com/tpope/vim-sleuth)**: Heuristically detects indentation settings.
-   **[vim-surround](https://github.com/tpope/vim-surround)**: Tools for changing surrounding delimiters (e.g., changing `"` to `'`).
-   **[vim-polyglot](https.com/sheerun/vim-polyglot)**: Provides syntax highlighting and indentation for a vast number of languages.
-   **[vim-dracula-pro](https://github.com/Mora1n/vim-dracula-pro)**: The color scheme for this configuration.
