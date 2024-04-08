return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"tpope/vim-fugitive",
	},
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			current_line_blame_formatter_opts = {
				relative_time = false,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		vim.keymap.set("n", "<leader>gs", ":Gitsigns preview_hunk<CR>", { desc = "Show Git Hunk" })
		vim.keymap.set(
			"n",
			"<leader>gt",
			":Gitsigns toggle_current_line_blame<CR>",
			{ desc = "Show Git Blame for current line." }
		)
		vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Show Git Blame for the entire file" })
		vim.keymap.set(
			"n",
			"<leader>gc",
			":Git commit<CR>",
			{ desc = "Commit to VCS from NeoVim. Use SPC GA to add new files first." }
		)
		vim.keymap.set(
			"n",
			"<leader>ga",
			":Git add .<CR>",
			{ desc = "Add files to VCS from NeoVim. Use SPC GC to commit the files." }
		)
		vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Push files to VCS from NeoVim" })
		vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Show VCS Log" })
		vim.keymap.set("n", "<leader>gg", ":Git pull<CR>", { desc = "Pull recent changes from VCS" })
		vim.keymap.set("n", "<leader>gr", ":Git clone ", { desc = "Pull recent changes from VCS" })
		vim.keymap.set("n", "<C-g>", ":Git<CR>", { desc = "Show VCS and its unstaged changes" })
	end,
}
