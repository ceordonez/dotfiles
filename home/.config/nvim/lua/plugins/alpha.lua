return {
    -- A nice first page nvim
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
    enable = false,
    cond = false,
	config = function()
		local alpha = require("alpha")
		local theta = require("alpha.themes.theta")
		local dashboard = require("alpha.themes.dashboard")
		theta.buttons.val = {
			dashboard.button("e", "ﱐ  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("<leader> f f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("<leader> f g", "  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- Do not show statusline or tabline in alpha buffer
		vim.cmd(
			[[ au User AlphaReady if winnr('$') == 1 | set laststatus=0 showtabline=0 | endif | au BufUnload <buffer> set laststatus=3 showtabline=2 ]]
		)
		-- Set theme and start alpha
		alpha.setup(theta.config)
	end,
}
