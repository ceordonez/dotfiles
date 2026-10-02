return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- main branch does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			ts.setup({})

			-- replaces ensure_installed (async, skips already-installed parsers)
			ts.install({ "html", "latex", "markdown", "markdown_inline", "yaml", "lua", "vimdoc" })

			-- replaces highlight = { enable = true }
			-- latex is left out on purpose, matching your old `disable = { "latex" }`
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "html", "yaml", "lua" },
				callback = function()
					vim.treesitter.start()
					-- replaces indent = { enable = true }
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}

