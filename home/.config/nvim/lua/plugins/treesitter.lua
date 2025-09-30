return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"html",
					-- "latex",
					"markdown",
					"markdown_inline",
					"yaml",
				},
				sync_install = false,
				highlight = {
					enable = true,
					disable = { "latex" },
				},
				indent = { enable = true },
			})
			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "nvim_treesitter#foldexpr()"
			vim.o.foldenable = false
		end,
	},
}
