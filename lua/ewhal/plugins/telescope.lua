return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                file_ignore_patterns = { "node_modules", ".git/", "__pycache__" },
            },
        })

        pcall(telescope.load_extension, "fzf")

        -- File search (like VSCode Ctrl+P)
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })

        -- Git files
        vim.keymap.set("n", "<leader>fi", builtin.git_files, { desc = "Find git files" })

        -- Live grep (like VSCode Ctrl+Shift+F)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Live grep" })

        -- Grep string under cursor
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })

        -- Buffers (like VSCode Ctrl+Tab for open files)
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

        -- Help tags
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

        -- Diagnostics (like VSCode's problems panel)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

        -- Recent files
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })

        -- Resume last search
        vim.keymap.set("n", "<leader>f.", builtin.resume, { desc = "Resume last search" })
    end,
}
