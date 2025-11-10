
-- vim.g.jupytext_jupytext = vim.env.HOME .. "/.virtualenvs/neovim/bin/jupytext" 

local nvim_venv_bin_path = vim.env.HOME .. "/.virtualenvs/neovim/bin"

vim.g.python3_host_prog = vim.env.HOME .. "/.virtualenvs/neovim/bin/python3"

vim.env.PATH = nvim_venv_bin_path .. ":" .. vim.env.PATH

vim.opt.title = true
vim.opt.titlestring = "%t %y"
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.encoding = "utf-8"
vim.opt.cursorline = true

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Lineabraks with indentation
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "󱞩 "
vim.opt.wrap = true

-- Change buffer without saving
vim.opt.hidden = true

-- Atomatically change current working directory to the directory
-- containing the file in the buffer
vim.opt.autochdir = true

-- Use spaces to replace tabs
vim.opt.expandtab = true

-- Allow virtual editing in visual block
vim.opt.virtualedit = "block"

-- Ignore certain files
vim.opt.wildignore = { "*.swp", "*.bak", "*.pyc", "*.class", "*.aux", "*.toc" }

-- Always show status bar
vim.opt.laststatus = 2

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.diffopt:append("vertical")
vim.opt.diffopt:append("linematch:60")

vim.opt.shada:append("r/mnt/intcdc")

-- Visual selection copies to the clipboard
vim.opt.clipboard:append("unnamedplus")

vim.g.completion_sorting = "none"
vim.g.completeopt = "menu,menuone,noinsert"

-- Size of the completion menu
vim.opt.pumheight = 15

-- Set python syntax for Freecad macros
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = { "*.fcmacro" },
  callback = function()
    vim.opt.filetype = "python"
  end,
})
-- Set tex syntax for pdf_tex files
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = { "*.pdf_tex" },
  callback = function()
    vim.opt.filetype = "tex"
  end,
})

-- dont list quickfix buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Disable editorconfig
vim.g.editorconfig = false

-- Set default tabsize
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.g.lazyvim_cmp="nvim-cmp"
-- 1. Define the toggle states (Unicode symbols)
vim.g.lists_todos = { '⬜', '⚡', '✅' }

-- reusable function to set colors + matches
local function set_todo_highlights()
  -- 1) Colors
  vim.api.nvim_set_hl(0, "TodoBox",  { fg = "#BF616A", bold = true})
  vim.api.nvim_set_hl(0, "TodoProg", { fg = "#81A1C1", bold = false })
  vim.api.nvim_set_hl(0, "TodoDone", { fg = "#A3BE8C", bold = false })

  -- 2) Matches (force with matchadd so they survive Treesitter)
  vim.fn.matchadd("TodoBox",  [[^\s*[-*+]\s\+⬜:.*$]])
  vim.fn.matchadd("TodoProg", [[^\s*[-*+]\s\+⚡:.*$]])
  vim.fn.matchadd("TodoDone", [[^\s*[-*+]\s\+✅:.*$]])
end

-- run once now
set_todo_highlights()

-- re-apply after colorscheme or buffer change
vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
  callback = set_todo_highlights,
})


-- Define state groups
local function reorder_todo_list()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local todo_lines, prog_lines, done_lines = {}, {}, {}

  for _, line in ipairs(lines) do
    local state = line:match("^%s*[-*+]%s+(%S+)")
    if state == "⬜:" then
      table.insert(todo_lines, line)
    elseif state == "⚡:" then
      table.insert(prog_lines, line)
    elseif state == "✅:" then
      table.insert(done_lines, line)
    else
      table.insert(todo_lines, line) -- fallback: treat as TODO
    end
  end

  -- Combine groups in order: TODO → IN-PROGRESS → DONE
  local new_lines = {}
  for _, l in ipairs(todo_lines) do table.insert(new_lines, l) end
  for _, l in ipairs(prog_lines) do table.insert(new_lines, l) end
  for _, l in ipairs(done_lines) do table.insert(new_lines, l) end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, new_lines)
end

-- Toggle keymap example
vim.keymap.set("n", "<leader>d", function()
  vim.cmd("normal! <Plug>(lists-toggle)") -- toggle symbol
  reorder_todo_list()                     -- reorder by group, stable
end, { noremap = true, silent = true })

-- Make history persistent between sessions
--vim.opt.undofile = true
--vim.opt.undodir = vim.env.HOME .. "/.config/nvim/undodir"
--
--if not vim.fn.isdirectory(vim.env.HOME .. "/.config/nvim/undodir") then
--  vim.fn.mkdir(vim.env.HOME .. "/.config/nvim/undodir")
--end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
