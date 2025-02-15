return {
  'gera2ld/ai.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function ()
    local ai = require('ai')
    local ok, opts = pcall(vim.fn.json_decode, os.getenv('AI_NVIM_PROVIDER_CONFIG'))
    opts = ok and opts or {}
    ai.setup(opts)
  end,
  event = 'VeryLazy',
}
