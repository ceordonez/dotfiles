return {
	"GCBallesteros/jupytext.nvim",
	ft = { "markdown", "quarto", "python", "ipynb" },
	lazy = false,

	config = function()
		require("jupytext").setup({
			style = "markdown",
			output_extension = "md",
			force_ft = "markdown",
		})
	end,
}
