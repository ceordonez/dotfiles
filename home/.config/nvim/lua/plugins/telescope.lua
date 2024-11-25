return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        cmd = "Telescope",
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "find files",
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "live grep",
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "find buffers",
            },
            {
                "<C-p>",
                function()
                    require("telescope.builtin").git_files()
                end,
                desc = "find git files",
            },
            {
                "<leader>ps",
                function()
                    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Grep",
            },
        },

        opts = {
            defaults = {
                scroll_strategy = "limit",
                winblend = 30,
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        width = 0.85,
                        height = 0.95,
                        preview_cutoff = 10,
                        mirror = false,
                    },
                    center = {
                        width = 0.85,
                        height = 0.95,
                        preview_cutoff = 10,
                        prompt_position = "top",
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "-L",
                },
                file_ignore_patterns = {
                    "%.pyc",
                    "%.rpy",
                    "%.fil",
                },
            },
            pickers = {
                find_files = {
                    follow = true,
                },
            },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
