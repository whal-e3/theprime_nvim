return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Support both old and new nvim-treesitter API
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
            configs.setup({
                ensure_installed = {
                    "javascript", "typescript", "c", "cpp", "python",
                    "lua", "vim", "vimdoc", "query", "html", "css",
                    "json", "yaml", "bash", "markdown", "markdown_inline",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        else
            -- New nvim-treesitter (v1.0+) uses require("nvim-treesitter").setup()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "javascript", "typescript", "c", "cpp", "python",
                    "lua", "vim", "vimdoc", "query", "html", "css",
                    "json", "yaml", "bash", "markdown", "markdown_inline",
                },
                auto_install = true,
            })
            -- Highlight and indent are enabled by default in new treesitter
        end
    end,
}
