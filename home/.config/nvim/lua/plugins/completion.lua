return {
    "stevearc/conform.nvim",
    config = function()
        conform = require("conform")
        conform.setup({
            lsp_fallback = true,
            formatters_by_ft = {
                bash = { "shfmt" },
                bib = { "bibtex-tidy" },
                html = { "htmlbeautifier" },
                json = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                sty = { "latexindent" },
                tex = { "latexindent" },
                yaml = { "yamlfmt" },
            },
        })
        vim.keymap.set("n", "gq", function()
            conform.format({ lsp_fallback = true })
        end)
    end
}
