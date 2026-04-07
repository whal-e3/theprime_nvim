return {
    -- Auto pairs (like VSCode auto-closing brackets)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },

    -- Comment toggle (like VSCode Ctrl+/)
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("Comment").setup()
            -- Ctrl+/ to toggle comment (like VSCode)
            vim.keymap.set("n", "<C-/>", function()
                require("Comment.api").toggle.linewise.current()
            end, { desc = "Toggle comment" })
            vim.keymap.set("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment" })
        end,
    },

    -- Auto close HTML/JSX tags
    { "windwp/nvim-ts-autotag", event = "InsertEnter", config = true },

    -- Surround (like VSCode bracket surround)
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },

    -- Terminal (like VSCode integrated terminal)
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 15,
                open_mapping = false, -- we handle this in remap.lua
                direction = "horizontal",
                shade_terminals = true,
                shading_factor = 2,
                float_opts = { border = "curved" },
            })
        end,
    },

    -- Undo tree (visual undo history)
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
        },
    },

    -- Harpoon (quick file bookmarks)
    {
        "theprimeagen/harpoon",
        keys = {
            { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
            { "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
            { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Harpoon file 1" },
            { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Harpoon file 2" },
            { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Harpoon file 3" },
            { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Harpoon file 4" },
        },
    },

    -- Highlight color codes (like VSCode color preview)
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup()
        end,
    },

    -- Better search highlight
    {
        "kevinhwang91/nvim-hlslens",
        event = "BufReadPre",
        config = function()
            require("hlslens").setup()
        end,
    },

    -- Smooth scrolling
    {
        "karb94/neoscroll.nvim",
        event = "BufReadPre",
        config = function()
            require("neoscroll").setup({ easing_function = "quadratic" })
        end,
    },
}
