# Neovim Setup Manual

## First Launch

When you open `nvim` for the first time, **lazy.nvim** will auto-bootstrap and install all plugins. Wait for it to finish, then restart nvim.

Make sure you have these prerequisites installed:

```bash
# Nerd Font (needed for icons) - install one from https://www.nerdfonts.com/
# Then set your terminal to use it.

# Build tools (for telescope-fzf-native)
sudo apt install -y build-essential

# Node.js (for some LSP servers)
sudo apt install -y nodejs npm

# ripgrep (for live grep in telescope)
sudo apt install -y ripgrep
```

---

## Keybinding Reference

**Leader key = `Space`**

### File Operations (like VSCode)

| Keybinding | Action |
|---|---|
| `Ctrl+S` | Save file |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+A` | Select all |
| `Ctrl+C` (visual) | Copy to system clipboard |
| `Ctrl+V` | Paste from system clipboard |

### File Navigation (like VSCode Ctrl+P)

| Keybinding | Action |
|---|---|
| `Ctrl+P` or `Space ff` | Find files (like Ctrl+P in VSCode) |
| `Space fg` or `Space fs` | Live grep (like Ctrl+Shift+F in VSCode) |
| `Space fw` | Grep word under cursor |
| `Space fb` | Open buffers (like Ctrl+Tab in VSCode) |
| `Space fr` | Recent files |
| `Space fi` | Git files only |
| `Space fd` | Diagnostics (like Problems panel) |
| `Space f.` | Resume last search |

### File Explorer (like VSCode Sidebar)

| Keybinding | Action |
|---|---|
| `Space e` | Toggle file explorer |
| `Space o` | Focus file explorer |

In the tree: `a` = new file, `d` = delete, `r` = rename, `c` = copy, `p` = paste.

### Split Resizing

| Keybinding | Action |
|---|---|
| `Ctrl+Right` | Increase split width |
| `Ctrl+Left` | Decrease split width |
| `Ctrl+Up` | Increase split height |
| `Ctrl+Down` | Decrease split height |

### Tabs / Buffers (like VSCode Tabs)

| Keybinding | Action |
|---|---|
| `Shift+H` | Previous tab |
| `Shift+L` | Next tab |
| `Space bd` | Close tab |
| `Space bD` | Close all tabs |

### Terminal (like VSCode Integrated Terminal)

| Keybinding | Action |
|---|---|
| `Ctrl+\` | Toggle terminal |
| `Esc` | Exit terminal mode back to normal |

### Claude Code

| Keybinding | Action |
|---|---|
| `Space cc` | Toggle Claude Code |

### Code Editing (like VSCode)

| Keybinding | Action |
|---|---|
| `Alt+J` / `Alt+K` | Move line(s) down/up |
| `Alt+Shift+J` / `Alt+Shift+K` | Duplicate line(s) down/up |
| `Ctrl+/` | Toggle comment (line or selection) |
| `Tab` / `Shift+Tab` (in visual) | Indent / Outdent (keeps selection) |
| `>` / `<` (in visual) | Indent / Outdent (keeps selection) |

### LSP / IntelliSense (like VSCode)

| Keybinding | Action |
|---|---|
| `gd` or `F12` | Go to definition |
| `gr` or `Shift+F12` | Find references |
| `K` | Hover documentation |
| `F2` or `Space rn` | Rename symbol |
| `Ctrl+.` or `Space ca` | Code action (quick fix) |
| `F8` / `Shift+F8` | Next / Prev diagnostic |
| `]d` / `[d` | Next / Prev diagnostic |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gt` | Type definition |
| `Space vd` | Show diagnostic float |
| `Space f` or `Alt+Shift+F` | Format document |
| `Ctrl+H` (insert mode) | Signature help |

### Autocompletion (in insert mode)

| Keybinding | Action |
|---|---|
| `Ctrl+Space` | Trigger completion |
| `Tab` / `Shift+Tab` | Navigate completion items |
| `Ctrl+J` / `Ctrl+K` | Navigate completion items |
| `Enter` | Confirm selection |
| `Ctrl+E` | Dismiss completion |
| `Ctrl+B` / `Ctrl+F` | Scroll docs |

### Git

| Keybinding | Action |
|---|---|
| `Space gs` | Git status (fugitive) |
| `]c` / `[c` | Next / Prev git hunk |
| `Space hs` | Stage hunk |
| `Space hr` | Reset hunk |
| `Space hp` | Preview hunk |
| `Space hb` | Blame line |
| `Space hd` | Diff this file |

### Harpoon (Quick File Bookmarks)

| Keybinding | Action |
|---|---|
| `Space a` | Add file to harpoon |
| `Space h` | Open harpoon menu |
| `Space 1-4` | Jump to harpoon file 1-4 |

### Other

| Keybinding | Action |
|---|---|
| `Space u` | Toggle undo tree |
| `Space s` | Search & replace word under cursor |
| `Space x` | Make current file executable |
| `Space Space` | Source current file |
| `Space py` | Insert python shebang |
| `Space pw` | Insert `from pwn import *` |

### Which-Key

Press `Space` and **wait 300ms** -- a popup will show all available keybindings. This is your cheat sheet while learning.

---

## Plugin Manager

Run `:Lazy` to open the plugin manager. From there:

- `S` = sync (install/update all)
- `U` = update plugins
- `X` = remove unused plugins
- `q` = close

## LSP Servers

Run `:Mason` to manage language servers. Pyright, clangd, lua_ls, and ts_ls are auto-installed. You can add more from the Mason UI.

---

## What Changed from the Old Config

1. **Packer -> lazy.nvim** -- Packer is archived; lazy.nvim is faster with lazy-loading
2. **Fixed bugs** -- `[d`/`]d` diagnostic direction was swapped; treesitter was set up twice; `vim.opt.binary = true` removed (was corrupting files); broken harpoon keybinds (`C-z/x/c/v` clashed with system shortcuts) remapped to `Space 1-4`; removed references to uninstalled plugins (vim-with-me, CellularAutomaton)
3. **Catppuccin Mocha** replaces rose-pine (more VSCode-like modern look, transparent bg preserved)
4. **New plugins**: nvim-tree (sidebar), bufferline (tabs), lualine (statusbar), gitsigns (git gutter), indent-blankline (indent guides), which-key, toggleterm, nvim-surround, nvim-ts-autotag, nvim-colorizer, nvim-notify, nvim-hlslens, neoscroll, alpha-nvim (dashboard), friendly-snippets, lspkind
5. **VSCode keybindings**: `Ctrl+S` save, `Ctrl+Z/Y` undo/redo, `Ctrl+P` find files, `Ctrl+/` comment, `Alt+J/K` move lines, `F2` rename, `F12` go-to-definition, `` Ctrl+` `` terminal, etc.
6. **Mouse enabled**, proper cursor shape (block in normal, line in insert)
7. **System clipboard** integrated via `unnamedplus` (no more manual `"+y` mapping needed)
8. **mason-lspconfig** added for automatic LSP server installation
