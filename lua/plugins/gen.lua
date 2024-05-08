return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "phi3",
    host = "localhost",
    port = "11434",
    quit_map = "q",
    retry_map = "<c-r>",
    init = function(options)
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- Function to initialize Ollama
    command = function(options)
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
    end,
    display_mode = "float",
    show_prompt = false,
    show_model = false,
    no_auto_close = false,
    debug = false,
  },
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>ai", ":Gen<CR>")
    require("gen").prompts["Elaborate_Text"] = {
      prompt = "Elaborate the following text:\n$text",
      replace = true,
    }
    require("gen").prompts["Fix_Code"] = {
      prompt =
      "Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }
  end,
}
