return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		opts = {
			auto_install = true,
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
		lazy = false,
		config = function()
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config.capabilities = lsp_capabilities

			-- Apply global diagnostics settings
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local util = require("lspconfig.util")
			--- Get python path considering local virtual environment folders
			local function get_python_path()
				local cwd = util.root_pattern("pyproject.toml")(vim.fn.getcwd()) or ""
				if vim.fn.executable(cwd .. "/.venv/bin/python3") == 1 then
					return cwd .. "/.venv/bin/python3"
				elseif vim.env.VIRTUAL_ENV then
					return vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python3")
				else
					return "python3"
				end
			end

			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
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
			-- Enable Python LSP
			vim.lsp.enable("basedpyright")

			-- LaTeX LSP
			vim.lsp.config("ltex_plus", {
				capabilities = capabilities,
				filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
				settings = {
					ltex = {
						enabled = { "latex", "tex", "bib", "markdown" },
						language = "auto", -- must be full locale
						additionalRules = { motherTongue = "es" },
						latex = {
							commands = {
								{ name = "qty", arguments = "ignore" }, -- ignore \qty
							},
						},
					},
				},
			})
			-- Enable LaTeX LSP
			vim.lsp.enable("ltex_plus")

			-- Markdown LSP
			vim.lsp.config("marksman", {
				capabilities = capabilities,
				on_attach = function(client)
					if client.name == "marksman" then
						vim.diagnostic.enable(false)
						vim.opt_local.spell = true
						vim.opt_local.spelllang = "en"
					end
				end,
			})

			-- Apply global diagnostics settings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
