return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/lazydev.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "nvim-lua/plenary.nvim" },
			--{ "ray-x/lsp_signature.nvim" },
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns
					-- the diagnostics icon based on the severity this only
					-- works on a recent 0.10.0 build. Will be set to "●" when
					-- not supported prefix = "icons",
				},
				severity_sort = true,
			},
			inlay_hints = {
				enabled = true,
			},
			-- add any global capabilities here
			capabilities = {},
			-- Automatically format on save
			autoformat = false,
		},
		config = function(_, opts)
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")
			-- local lspconfig = vim.lsp.config
			--local lsp_defaults = lspconfig.util.default_config
			--local lsp_defaults = vim.lsp.config"util"

			--lspconfig.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, lsp_capabilities)

			vim.lsp.config.capabilities = lsp_capabilities

			require("mason").setup({})

			-- Python LSP
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }

			local util = require("lspconfig.util")
			--- Get python path considering local virtual environment folders
			local function get_python_path()
				local cwd = util.root_pattern("pyproject.toml")(vim.fn.getcwd()) or ""
				if vim.fn.executable(cwd .. "/.virtualenvs/bin/python3") == 1 then
					return cwd .. "/.virtualenvs/bin/python3"
				else
					return "python3"
				end
			end

			vim.lsp.config("basedpyright", {
				settings = {
					python = {
						pythonPath = get_python_path(),
					},
					basedpyright = {
						disableOrganizeImports = true,
						venvPath = ".virtualenvs",
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							useLibraryCodeForTypes = true,
							autoImportCompletions = false,
							typeCheckingMode = "basic",
						},
					},
				},
			})
			-- -- Grammar correction using ltex-ls
			-- local ltex_setup = {
			-- 	-- filetypes = { "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "typst" },
			-- 	filetypes = { "tex", "bib", "markdown", "latex" },
			-- 	settings = {
			-- 		ltex = {
			-- 			language = "en-US",
			-- 			additionalRules = {
			-- 				motherTongue = "es",
			-- 			},
			-- 			latex = {
			-- 				commands = {
			-- 					-- "qty", -- Ignore `\qty`
			-- 					{ name = "qty", arguments = "ignore" }, -- Specify that `\qty` takes 2 arguments
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- }

			vim.lsp.config("ltex", {
				filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
				settings = {
					ltex = {
						enabled = { "latex", "tex", "bib", "markdown" },
						language = "en-US", -- must be full locale
						additionalRules = { motherTongue = "es" },
						latex = {
							commands = {
								{ name = "qty", arguments = "ignore" }, -- ignore \qty
							},
						},
					},
				},
			})

			-- vim.lsp.enable("ltex")
			--lspconfig("lua_ls")
			-- vim.lsp.config("ltex", ltex_setup)
			-- vim.lsp.enable("ltex")
			vim.lsp.config("marksman", {
				on_attach = function(client, bufnr)
					if client.name == "marksman" then
						vim.diagnostic.enable(false)
						vim.opt_local.spell = true
						vim.opt_local.spelllang = "en"
					end
				end,
			})
            vim.lsp.enable("marksman")
			-- lspconfig("r_language_server", {})
			-- lspconfig("bashls", {})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"folke/lazydev.nvim",
		opts = {
			lspconfig = true,
		},
	},
	--{
	--	"ray-x/lsp_signature.nvim",
	--	event = "VeryLazy",
	--	opts = {
	--		bind = true,
	--		hint_enable = true,
	--		doc_lines = 0,
	--		floating_window = false,
	--		toggle_key = "<C-i>",
	--		select_signature_key = "<C-l>",
	--		floating_window_above_cur_line = true,
	--		handler_opts = {
	--			border = "rounded",
	--		},
	--	},
	--	config = function(_, opt)
	--		require("lsp_signature").setup(opts)
	--	end,
	--},
}
