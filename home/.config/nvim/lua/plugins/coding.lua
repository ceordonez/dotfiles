return {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "lewis6991/async.nvim" },
<<<<<<< HEAD

=======
>>>>>>> 5bf0b3f (Adding onedrive configuration, small changes to neovim config: new luasnips for markdown, fix model for copilot, mapping for list in markdown and small changes to cmp config)
			-- { "nvim-treesitter/nvim-treesitter" }
		},
		ft = { "python", "lua" },
		keys = {
			{
				"<leader>re",
				"<cmd>Refactor extract<cr>",
				mode = "v",
				{ noremap = true, silent = true, expr = false },
			},
			{
				"<leader>rf",
				"<cmd>Refactor extract_to_file<cr>",
				mode = "v",
				{ noremap = true, silent = true, expr = false },
			},
			{
				"<leader>rv",
				"<cmd>Refactor extract_var<cr>",
				mode = "v",
				{ noremap = true, silent = true, expr = false },
			},
			{
				"<leader>ri",
				"<cmd>Refactor inline_var<cr>",
				mode = "v",
				{ noremap = true, silent = true, expr = false },
			},
		},
		config = function()
			require("refactoring").setup({})
		end,
	},
}
-- vim: set shiftwidth=2:
