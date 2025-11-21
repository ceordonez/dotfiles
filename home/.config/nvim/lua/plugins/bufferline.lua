return {
	-- This plugin control the buffer tabs
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true, require("bufferline").setup({})
	end,
}
