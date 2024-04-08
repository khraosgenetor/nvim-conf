return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
    vim.keymap.set('n', "<leader>ff", ":FzfLua files<CR>", {})
    vim.keymap.set('n', "<leader>fg", ":FzfLua live_grep<CR>", {})
    vim.keymap.set('n', "<leader>fb", ":FzfLua buffers<CR>", {})
    vim.keymap.set('n', "<leader>fh", ":FzfLua helptags<CR>", {})

    vim.keymap.set('n', "<leader>", ":FzfLua keymaps<CR>", {})
  end
}
