return {
    -- Mason: install LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },

    -- Bridge mason <-> lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "clangd",
                    "lua_ls",
                    "ts_ls",
                },
                automatic_installation = true,
            })
        end,
    },

    -- LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local bufnr = ev.buf

                    -- Go to definition (like VSCode F12)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
                    vim.keymap.set("n", "<F12>", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })

                    -- Hover info (like VSCode hover)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover info" })

                    -- Workspace symbol search
                    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { buffer = bufnr, desc = "Workspace symbols" })

                    -- Show diagnostics float
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostic" })

                    -- Diagnostic navigation
                    local goto_next = function() vim.diagnostic.jump({ count = 1 }) end
                    local goto_prev = function() vim.diagnostic.jump({ count = -1 }) end
                    vim.keymap.set("n", "]d", goto_next, { buffer = bufnr, desc = "Next diagnostic" })
                    vim.keymap.set("n", "[d", goto_prev, { buffer = bufnr, desc = "Prev diagnostic" })
                    vim.keymap.set("n", "<F8>", goto_next, { buffer = bufnr, desc = "Next diagnostic" })
                    vim.keymap.set("n", "<S-F8>", goto_prev, { buffer = bufnr, desc = "Prev diagnostic" })

                    -- Code actions (like VSCode Ctrl+.)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

                    -- References (like VSCode Shift+F12)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
                    vim.keymap.set("n", "<S-F12>", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

                    -- Rename (like VSCode F2)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })

                    -- Signature help
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })

                    -- Go to declaration / implementation / type definition
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
                    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type definition" })
                end,
            })

            -- Configure servers using new vim.lsp.config API (nvim 0.11+)
            local servers = {
                pyright = {},
                clangd = {},
                ts_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        },
                    },
                },
            }

            for server, opts in pairs(servers) do
                opts.capabilities = capabilities
                vim.lsp.config(server, opts)
            end
            vim.lsp.enable(vim.tbl_keys(servers))

            -- Diagnostic appearance (VSCode-like)
            vim.diagnostic.config({
                virtual_text = { spacing = 4, prefix = "●" },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = { border = "rounded", source = true },
            })
        end,
    },

    -- Autocompletion (like VSCode IntelliSense)
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
            })
        end,
    },
}
