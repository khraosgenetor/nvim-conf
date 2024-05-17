return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.6", -- Note the correct tag syntax
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		end,
	},
	{
		"nosduco/remote-sshfs.nvim",
		config = function()
			require("remote-sshfs").setup({})
			require("telescope").load_extension("remote-sshfs")
			local api = require("remote-sshfs.api")
			vim.keymap.set("n", "<leader>rc", api.connect, {})
			vim.keymap.set("n", "<leader>rd", api.disconnect, {})
			vim.keymap.set("n", "<leader>re", api.edit, {})

			local builtin = require("telescope.builtin")
			local connections = require("remote-sshfs.connections")
			vim.keymap.set("n", "<leader>rf", function()
				if connections.is_connected then
					api.find_files()
				else
					builtin.find_files()
				end
			end, {})
			vim.keymap.set("n", "<leader>rg", function()
				if connections.is_connected then
					api.live_grep()
				else
					builtin.live_grep()
				end
			end, {})
		end,
	},
}
