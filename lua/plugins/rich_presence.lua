return {
  "andweeb/presence.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("presence"):setup({
      neovim_image_text = "Neovim",
    })
  end
}
