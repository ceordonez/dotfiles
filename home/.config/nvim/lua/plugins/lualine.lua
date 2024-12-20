return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "nord",
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
		},
		extensions = { "quickfix", "neo-tree" },
	},
}
