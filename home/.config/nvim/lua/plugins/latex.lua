return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		ft = { "tex", "cls", "sty", "tikz" },
		dependencies = {
			{ "hrsh7th/nvim-cmp" },
		},
		keys = {
			{ "<localleader>ll", "<Plug>(vimtex-compile-ss)" },
			{ "<localleader>ll", "<Plug>(vimtex-compile-selected)", mode = "v" },
			{ "<localleader>lv", "<Plug>(vimtex-view)" },
			{ "<localleader>lo", "<Plug>(vimtex-compile-output)" },
			{ "<localleader>rf", "<cmd>VimtexRefreshFolds<cr>" },
		},

		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.tex_flavor = "latex"

			local cmp = require("cmp")

			cmp.setup.filetype("tex", {
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
							buffer = "[Buffer]",
							-- formatting for other sources
						})[entry.source.name]
						return vim_item
					end,
				},
			})
			--vim.g.vimtex_view_method = "zathura"
			-- Set options for vimtex
			vim.g.vimtex_toc_config = {
				layer_status = {
					content = 1,
					label = 0,
					todo = 1,
					include = 0,
				},
			}

			vim.g.vimtex_compiler_latexmk = {
				out_dir = "out",
				aux_dir = ".aux",
				-- aux_dir = "/tmp/latex-aux",
				callback = 1,
				continuous = 0,
				executable = "latexmk",
				options = {
					"-verbose",
					"-shell-escape",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}

			vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }

			vim.g.vimtex_complete_enabled = 1
			vim.g.vimtex_complete_close_braces = 0
			vim.g.vimtex_complete_ignore_case = 1
			vim.g.vimtex_complete_smart_case = 1
			vim.g.vimtex_fold_enabled = 1

			vim.g.vimtex_fold_types = {
				sections = {
					parse_levels = 0,
					sections = {
						"%(add)?part",
						"%(chapter|addchap)",
						"%(section|addsec)",
						"%(subsection|workpackage)",
						"%(subsubsection|subworkpackage)",
					},
					parts = {
						"appendix",
						"frontmatter",
						"mainmatter",
						"backmatter",
					},
				},
			}
			vim.opt_local.foldnestmax = 4

			vim.g.vimtex_parser_bib_backend = "lua"

			vim.g.vimtex_syntax_enabled = true
			vim.g.vimtex_syntax_conceal = {
				accents = 1,
				ligatures = 0,
				cites = 1,
				fancy = 0,
				spacing = 0,
				greek = 0,
				math_bounds = 0,
				math_delimiters = 0,
				math_fracs = 0,
				math_super_sub = 0,
				math_symbols = 1,
				sections = 0,
				styles = 1,
			}

			-- vim.l.concealcursor = ''

			vim.g.vimtex_indent_enabled = true
			vim.g.vimtex_indent_on_ampersands = false
			vim.g.vimtex_indent_bib_enabled = false
			vim.g.vimtex_fold_bib_enabled = false

			vim.g.vimtex_imaps_leader = "#"
			vim.g.vimtex_quickfix_method = "latexlog"
			vim.g.matchup_override_vimtex = true

			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_forward_search_on_start = true

			vim.g.vimtex_echo_verbose_input = 0

			vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
			vim.g.vimtex_quickfix_open_on_warning = 0

			-- Delimiter modifiers
			vim.g.vimtex_delim_toggle_mod_list = {
				{ "\\left", "\\right" },
				{ "\\mleft", "\\mright" },
			}
		end,
	},
	-- 		vim.g.vimtex_compiler_latexmk = {
	-- 			out_dir = "out",
	-- 			aux_dir = ".aux",
	-- 			callback = 1,
	-- 			continuous = 0,
	-- 			executable = "latexmk",
	-- 			options = {
	-- 				"-verbose",
	-- 				"-shell-escape",
	-- 				"-file-line-error",
	-- 				"-synctex=1",
	-- 				"-interaction=nonstopmode",
	-- 			},
	-- 		}
	-- 	end,
	-- },
}
