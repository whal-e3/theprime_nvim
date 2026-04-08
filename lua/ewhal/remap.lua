-- NOTE: leader is set in set.lua as <Space>

-- File explorer (like VSCode sidebar toggle)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Move selected lines up/down (Alt+Up/Down like VSCode)
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Duplicate lines (like VSCode Alt+Shift+Down/Up)
vim.keymap.set("n", "<A-S-j>", "<cmd>t .<CR>", { desc = "Duplicate line down" })
vim.keymap.set("n", "<A-S-k>", "<cmd>t .-1<CR>", { desc = "Duplicate line up" })
vim.keymap.set("v", "<A-S-j>", ":'<,'>t '><CR>gv", { desc = "Duplicate selection down" })
vim.keymap.set("v", "<A-S-k>", ":'<,'>t '<-1<CR>gv", { desc = "Duplicate selection up" })

-- Keep cursor centered on scroll/search
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting register (in visual mode)
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Copy/Paste (Ctrl+C / Ctrl+V like VSCode)
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy" })
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste" })
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste" })

-- Disable Q (ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- Format (like VSCode Shift+Alt+F)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", "<A-S-f>", vim.lsp.buf.format, { desc = "Format document" })

-- Quickfix / location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location" })

-- Search and replace word under cursor (like VSCode Ctrl+H with selection)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Source current file
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source file" })

-- Save (Ctrl+S like VSCode)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- Undo/Redo (Ctrl+Z / Ctrl+Y like VSCode)
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Redo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

-- Select all (Ctrl+A like VSCode)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Indent/outdent in visual mode (keep selection)
vim.keymap.set("v", "<", "<gv", { desc = "Outdent" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent" })

-- Window/split navigation (Ctrl+hjkl)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Resize splits (Ctrl+Arrow keys)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<CR>", { desc = "Increase split width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<CR>", { desc = "Decrease split width" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +3<CR>", { desc = "Increase split height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -3<CR>", { desc = "Decrease split height" })

-- Buffer navigation (like VSCode tabs)
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bdelete<CR>", { desc = "Close all tabs" })

-- Terminal toggle (Ctrl+` doesn't work in most terminals, use C-\ instead)
vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Comment toggle (gcc/gc in visual) is handled by Comment.nvim plugin

-- Python shortcuts
vim.api.nvim_set_keymap('n', '<leader>py', [[:normal! i#!/usr/bin/env python3<ESC>]], { noremap = true, silent = true, desc = "Insert python shebang" })
vim.api.nvim_set_keymap('n', '<leader>pw', [[:normal! ifrom pwn import *<ESC>]], { noremap = true, silent = true, desc = "Insert pwn import" })
