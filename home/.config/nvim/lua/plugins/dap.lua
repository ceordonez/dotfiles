return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dappy = require("dap-python")

			dapui.setup()
			dappy.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<F8>", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<F6>", function()
				dap.continue()
			end)
			local ui_config = {
				icons = { expanded = "🞃", collapsed = "🞂", current_frame = "→" },
				controls = {
					icons = {
						pause = "⏸",
						play = "⯈",
						step_into = "↴",
						step_over = "↷",
						step_out = "↑",
						step_back = "↶",
						run_last = "🗘",
						terminate = "🕱",
						disconnect = "⏻",
					},
				},
			}
            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Debug", linehl = "", numhl = "" })
			dapui.setup(ui_config)
		end,
	},
}
