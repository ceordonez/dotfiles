return {
	-- This is to auto close parentisis
	"echasnovski/mini.nvim",
	version = false,
	lazy = true,
	config = function()
		require("mini.pairs").setup()
	end,
}
