return {
	{
		"lervag/wiki.vim",
		dependencies = {
			--{ "lervag/wiki-ft.vim" },
			--{ "nabla" },
			{ 
                "lervag/lists.vim",
                config = function()
                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = "markdown",
                        callback = function()
                            vim.cmd("ListsEnable")
                        end,
                    })
                end,
            },
		},
		-- tag = "v0.8",
		lazy = true,
		cmd = "WikiIndex",
		keys = {
			{ "<leader>wst", "<cmd>:WikiTags<cr>", desc = "Search tags." },
			{ "<leader>ww", "<cmd>:WikiIndex<cr>", desc = "Wiki Index" },
		},
		init = function()
			-- Root folder
			vim.g.wiki_root = "~/Documents/Notes/"
		end,
		config = function()
			vim.opt.autochdir = true
		end,
	},
	{
		"jalvesaq/zotcite",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			SQL_path = "~/Zotero/zotero.sqlite",
			citation_template = "{author}_{year}",
		},
		config = function(_, opts)
			require("zotcite").setup({
				-- SQL_path = "~/Zotero/zotero.sqlite",
				-- your options here (see doc/zotcite.txt)
			})
		end,
	},
	{
		"jalvesaq/cmp-zotcite",
		dependencies = { "jalvesaq/zotcite" },
		opts = {
			filetypes = { "markdown", "pandoc", "rmd", "vimwiki" },
		},
	},
	-- {
	-- 	"lervag/lists.vim",
	-- 	ft = "md",
	-- 	-- init = function()
	-- 	--     vim.g.lists_filetypes = { "md" }
	-- 	-- end
	-- },
}
