return {
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				enabled = true, --
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = false, --
					next = "<C-n>", -- Ctrl+] : next
					prev = "<C-p>", -- Ctrl+[ : prev
					dismiss = "<C-e>", -- cancel
				},
			},
			panel = {
				enabled = true, --
				auto_refresh = true,
				keymap = {
					open = "<M-CR>", -- Alt+Enter :
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
			auto_insert_mode = true,
			show_help = true,
			answer_header = "## Copilot Answer",
			question_header = "## Your Question",
			window = {
				layout = "vertical",
				width = 0.3,
				height = 0.5,
				relative = "editor",
				border = "rounded",
			},
			selection = function(source)
				return require("CopilotChat.selection").buffer(source)
			end,
			system_prompt = "You are an AI programming assistant. Always provide helpful, accurate, and concise responses.",
			model = "gpt-4o", -- GPT-4o
			temperature = 0.1,
			context = "buffers", --
			mappings = {
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},
				close = {
					normal = "q",
					insert = "<C-c>",
				},
				reset = {
					normal = "<C-r>",
					insert = "<C-r>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
			},
			prompts = {
				Explain = {
					prompt = "Please explain how the following code works in detail.",
				},
				Review = {
					prompt = "Please review the following code and provide suggestions for improvement including best practices.",
				},
				Fix = {
					prompt = "Please fix the following code to resolve any issues or errors.",
				},
				Optimize = {
					prompt = "Please optimize the following code for better performance and efficiency.",
				},
				Docs = {
					prompt = "Please provide comprehensive documentation for the following code including parameters and return values.",
				},
				Tests = {
					prompt = "Please generate comprehensive unit tests for the following code.",
				},
				Refactor = {
					prompt = "Please refactor the following code to improve readability and maintainability.",
				},
			},
		},
		keys = {
			-- 기본 Chat 기능
			{ "<leader>ii", "<cmd>CopilotChat<cr>", desc = "Open Copilot Chat" },
			{ "<leader>ie", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code" },
			{ "<leader>if", "<cmd>CopilotChatFix<cr>", desc = "Fix Code" },
			{ "<leader>io", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code" },
			{ "<leader>ir", "<cmd>CopilotChatReview<cr>", desc = "Review Code" },

			-- Agent 고급 기능
			{ "<leader>id", "<cmd>CopilotChatDocs<cr>", desc = "Generate Documentation" },
			{ "<leader>it", "<cmd>CopilotChatTests<cr>", desc = "Generate Tests" },
			{ "<leader>iD", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix Diagnostic Issue" },
			{ "<leader>ic", "<cmd>CopilotChatCommit<cr>", desc = "Generate Commit Message" },
			{ "<leader>iC", "<cmd>CopilotChatCommitStaged<cr>", desc = "Commit Message for Staged" },
			{ "<leader>iR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor Code" },

			-- Visual mode 지원
			{ "<leader>iv", ":<C-u>CopilotChatVisual<cr>", mode = "x", desc = "Chat with Selection" },
			{ "<leader>ie", ":<C-u>CopilotChatExplain<cr>", mode = "x", desc = "Explain Selection" },
			{ "<leader>ir", ":<C-u>CopilotChatReview<cr>", mode = "x", desc = "Review Selection" },
			{ "<leader>if", ":<C-u>CopilotChatFix<cr>", mode = "x", desc = "Fix Selection" },

			-- Chat 창 관리
			{ "<leader>iq", "<cmd>CopilotChatClose<cr>", desc = "Close Chat Window" },
			{ "<leader>ix", "<cmd>CopilotChatReset<cr>", desc = "Reset Chat History" },
			{ "<leader>is", "<cmd>CopilotChatStop<cr>", desc = "Stop Current Generation" },
			{ "<leader>i?", "<cmd>CopilotChatDebugInfo<cr>", desc = "Show Debug Info" },
			{ "<leader>il", "<cmd>CopilotChatLoad<cr>", desc = "Load Chat History" },
			{ "<leader>iS", "<cmd>CopilotChatSave<cr>", desc = "Save Chat History" },

			-- 버퍼/파일 관리
			{ "<leader>ib", "<cmd>CopilotChatBuffer<cr>", desc = "Chat about Current Buffer" },
			{ "<leader>ia", "<cmd>CopilotChatAgents<cr>", desc = "Show Available Agents" },
			{ "<leader>im", "<cmd>CopilotChatModels<cr>", desc = "Select Model" },
		},
	},
}
