return {
	"mfussenegger/nvim-dap",
	event = "BufRead",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local virtual_text = require("nvim-dap-virtual-text")

		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
			name = "lldb",
		}

		local lldb = {
			name = "Launch lldb",
			type = "lldb", -- matches the adapter
			request = "launch", -- could also attach to a currently running process
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			runInTerminal = false,
		}

		dap.configurations.rust = {
			lldb,
		}

		dapui.setup()
		virtual_text.setup()

		local wk = require("which-key")

		wk.register({
			d = {
				name = "+Debug",
				b = { dap.toggle_breakpoint, "Breakpoint" },
				c = { dap.continue, "Continue" },
				i = { dap.step_into, "Into" },
				o = { dap.step_over, "Over" },
				O = { dap.step_out, "Out" },
				r = { dap.repl.toggle, "Repl" },
				l = { dap.run_Last, "Last" },
				u = { dapui.toggle, "UI" },
				x = { dap.terminate, "Exit" },
			},
		}, {
			mode = "n",
			prefix = "<leader>",
		})
	end,
}
