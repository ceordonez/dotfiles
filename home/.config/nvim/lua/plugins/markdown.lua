-- install markdown-preview.nvim without yarn or npm
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
-- 	ft = { "markdown" },
-- 	build = function()
-- 		vim.cmd([[Lazy load markdown-preview.nvim]])
-- 		vim.fn["mkdp#util#install"]()
-- 	end,
-- }

-- require('lazy').setup({
return {
	-- Your other plugins
	{
		"jakewvincent/mkdnflow.nvim",
		ft = { "markdown", "rmd" }, -- Add custom filetypes here if configured
		config = function()
			require("mkdnflow").setup({
				links = {
					style = "markdown", -- Use "markdown" for standard Markdown links
					conceal = false, -- Set to true to conceal the link syntax
				},
				-- Your config
			})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- markview recommends not lazy-loading it
		config = function()
			require("markview").setup({})

			-- Your config
		end,
	},
}
