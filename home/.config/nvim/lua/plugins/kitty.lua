return {
	"knubie/vim-kitty-navigator",
	build = "cp ./*.py ~/.config/kitty/",
	cond = function()
		return vim.env.TMUX == nil
	end,
}
