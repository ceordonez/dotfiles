-- Movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")

-- Map <Esc> to shift-space
vim.keymap.set({ "i", "v", "s" }, "<S-Space>", "<Esc>")
vim.keymap.set({ "i", "v", "s" }, "<M-Space>", "<Esc>")
vim.keymap.set({ "i", "v", "s" }, "<c-e>", "<Esc>")

-- Faster folding
vim.keymap.set({ "n", "v" }, "<space>", "za")

-- Correct spelling in insert mode
vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- Move to next buffer
vim.keymap.set("n", "tn", "<cmd>bnext<cr>")
vim.keymap.set("n", "tp", "<cmd>bprevious<cr>")
-- Close current buffer
vim.keymap.set("n", "<leader>bq", "<cmd>bp <BAR> bd #<cr>")

--vim.opt.guicursor =
--  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
