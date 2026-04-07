vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers (relative + absolute)
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation (4 spaces like VSCode default)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Word wrap off (like VSCode default)
vim.opt.wrap = false

-- Persistent undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search (incremental, case-insensitive unless uppercase used)
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

-- Splits open like VSCode
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse enabled (VSCode-like)
vim.opt.mouse = "a"

-- Cursor style (block in normal, line in insert like VSCode)
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Clipboard: use system clipboard via WSL interop (clip.exe / powershell.exe)
vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 or (vim.fn.has("unix") == 1 and vim.fn.executable("clip.exe") == 1) then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

-- File handling
vim.opt.isfname:append("@-@")
vim.opt.fileencoding = "utf-8"

-- Show whitespace characters (like VSCode's renderWhitespace)
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Completion
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.pumheight = 10

-- Minimal fold setup (disabled by default, available on demand)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
