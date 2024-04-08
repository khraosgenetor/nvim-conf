return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>dbp", dap.toggle_breakpoint, {})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
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

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "-i", "dap" },
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
			}

      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
		end,
	},
}
