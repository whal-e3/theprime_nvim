# Neovim Config

Personal neovim setup with VSCode-like keybindings and UX. Originally based on [theprimeagen](https://www.youtube.com/@ThePrimeTimeagen)'s config, now fully rewritten with lazy.nvim.

## Prerequisites

- Neovim >= 0.11.0
- A [Nerd Font](https://www.nerdfonts.com/) installed and set in your terminal
- `build-essential` (for telescope-fzf-native)
- `nodejs` and `npm` (for some LSP servers)
- `ripgrep` (for live grep)

```bash
sudo apt install -y build-essential nodejs npm ripgrep
```

## Install

1. Clone this repo to `~/.config/nvim`
2. Open `nvim` -- lazy.nvim will auto-bootstrap and install all plugins
3. Restart nvim after the first install completes
4. Run `:Mason` to verify language servers are installed

## Commands in nvim

- `:Lazy` -- Plugin manager (sync, update, clean)
- `:Mason` -- LSP server manager (install/remove language servers)

## Usage

See [manual.md](manual.md) for the full keybinding reference and feature guide.
