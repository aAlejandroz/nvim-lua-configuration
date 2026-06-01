return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"mason-org/mason.nvim",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup()

		dap.configurations.javascript = {
			{
				type = "node2",
				name = "10.15.55.164:3066",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				address = "10.15.55.164",
				port = 3066,
			},
			{
				type = "node2",
				name = "node attach (local)",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
			},
		}
		local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" },
		}

		vim.keymap.set("n", "<space>de", function()
			require("dapui").eval(nil, { enter = true })
		end, { desc = "[D]ebugger [E]valuate variable" })

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F1>", dap.continue, {})
		vim.keymap.set("n", "<F2>", dap.step_into, {})
		vim.keymap.set("n", "<F3>", dap.step_over, {})
		vim.keymap.set("n", "<F4>", dap.step_out, {})
		vim.keymap.set("n", "<F13>", dap.restart, {})

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
	end,
}

-- vim: ts=2 sts=2 sw=2 et
