return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	event = VeryLazy,
	cond = function()
		return vim.env.TMUX ~= nil
	end,
	-- vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>'),
	-- vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>'),
	-- vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>'),
	-- vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>'),
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", "n", { silent = true } },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", "n", { silent = true } },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", "n", { silent = true } },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", "n", { silent = true } },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", "n", { silent = true } },
	},
	--init = function()
	--	vim.g.tmux_navigator_no_mappings = true
	--end,
}
