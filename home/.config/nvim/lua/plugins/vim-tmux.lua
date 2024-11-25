return {
	"christoomey/vim-tmux-navigator",
    vim.keymap.set('n', 'M-h', ':TmuxNavigateLeft<CR>'),
    vim.keymap.set('n', 'M-j', ':TmuxNavigateDown<CR>'),
    vim.keymap.set('n', 'M-k', ':TmuxNavigateUp<CR>'),
    vim.keymap.set('n', 'M-l', ':TmuxNavigateRight<CR>'),
    --keys = {
	--	{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", "n", { silent = true } },
	--	{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", "n", { silent = true } },
	--	{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", "n", { silent = true } },
	--	{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", "n", { silent = true } },
	--	{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", "n", { silent = true } },
	--},
	--init = function()
	--	vim.g.tmux_navigator_no_mappings = true
	--end,
}
