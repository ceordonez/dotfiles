return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- Autocompletion for path
		"hrsh7th/cmp-path",
	},
	{ "hrsh7th/cmp-buffer" },
	{
		"L3MON4D3/LuaSnip",
		tag = "v2.4.1",
		build = "make install_jsregexp",

		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			-- 	-- "micangl/cmp-vimtex",
			-- 	"hrsh7th/cmp-cmdline",
			-- 	-- "kdheepak/cmp-latex-symbols",
		},
		config = function()
			local ls = require("luasnip")
			vim.keymap.set({ "i", "s" }, "<M-n>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<M-b>", function()
				if ls.jumpable() then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local copilot_suggestion = require("copilot.suggestion")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, { name = "lazydev", group_index = 0 })
				return opts
			end
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-l>"] = cmp.mapping(function(fallback)
						if copilot_suggestion.is_visible() then
							copilot_suggestion.accept()
							return
						end
						fallback()
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
							return
						end
						fallback()
						-- cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					end, { "i", "s" }),
					["<M-n>"] = cmp.mapping(function(fallback)
						if copilot_suggestion.is_visible() then
							copilot_suggestion.next()
							return
						end
						fallback()
					end, { "i", "s" }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
							return
						end
						fallback()
					end, { "i", "s" }),
					--
					["<C-p>"] = cmp.mapping(function(fallback)
						if copilot_suggestion.is_visible() then
							copilot_suggestion.next()
							return
						end
						fallback()
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
							return
						end
						fallback()
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					--{ name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "path", option = { trailin_slash = true }, priority = 4 },
					-- { name = "latex_symbols", priority = 2 },
					-- { name = "cmp_zotcite" },
					{ name = "copilot" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = { "lua" },
		opts = {
			lspconfig = true,
		},
	},
}
