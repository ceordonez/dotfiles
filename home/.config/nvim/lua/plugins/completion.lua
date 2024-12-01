return {
	"stevearc/conform.nvim",
    lazy = true,
	opts = {
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
	},
	keys = {
		{
			"gq",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			desc = "Comform formatting",
		},
	},
}
