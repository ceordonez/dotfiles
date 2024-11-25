return {
    {
        "lervag/wiki.vim",
        dependencies = {
            --{ "lervag/wiki-ft.vim" },
            --{ "nabla" },
            { "lervag/lists.vim" },
        },
        -- tag = "v0.8",
        lazy = true,
        cmd = "WikiIndex",
        init = function()
            -- Root folder
            vim.g.wiki_root = "~/Dropbox/Cesar/Notes/"
            -- Keymaps
            vim.api.nvim_set_keymap("n", "<leader>wst", ":WikiTags<cr>", { desc = "Search tags." })
            vim.api.nvim_set_keymap("n", "<leader>ww", ":WikiIndex<cr>", {})
        end,
        config = function()
            vim.opt.autochdir = true
        end,
    },
    {
        "jalvesaq/zotcite",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("zotcite").setup({
                SQL_path = "~/Zotero/zotero.sqlite",
                citation_template = "{author}_{year}",
                filetypes = { "markdown", "pandoc", "rmd", "vimwiki" },
                -- your options here (see doc/zotcite.txt)
            })
        end,
    },
    {
        "jalvesaq/cmp-zotcite",
    },
    {
        "lervag/lists.vim",
        init = function()
            vim.g.lists_filetypes = { "md" }
        end

    },
}
