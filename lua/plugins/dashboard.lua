return {
  "goolord/alpha-nvim",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      " ▄█     █▄     ▄████████  ▄█        ▄████████  ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████    ",
      "███     ███   ███    ███ ███       ███    ███ ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███    ",
      "███     ███   ███    █▀  ███       ███    █▀  ███    ███ ███   ███   ███   ███    █▀     ",
      "███     ███  ▄███▄▄▄     ███       ███        ███    ███ ███   ███   ███  ▄███▄▄▄        ",
      "███     ███ ▀▀███▀▀▀     ███       ███        ███    ███ ███   ███   ███ ▀▀███▀▀▀        ",
      "███     ███   ███    █▄  ███       ███    █▄  ███    ███ ███   ███   ███   ███    █▄     ",
      "███ ▄█▄ ███   ███    ███ ███▌    ▄ ███    ███ ███    ███ ███   ███   ███   ███    ███    ",
      " ▀███▀███▀    ██████████ █████▄▄██ ████████▀   ▀██████▀   ▀█   ███   █▀    ██████████ ██ ",
      "                                                                                       ▀ ",
      "                                                                                         ",
      "        ▄█   ▄█▄    ▄█   ▀█▄       ▄████████    ▄████████  ▄██████▄     ▄████████   ██   ",
      "       ███ ▄███▀   ███    ███     ███    ███   ███    ███ ███    ███   ███    ███   ██   ",
      "       ███▐██▀     ███    ███     ███    ███   ███    ███ ███    ███   ███    █▀    ██   ",
      "      ▄█████▀     ▄███▄▄▄▄███▄▄  ▄███▄▄▄▄██▀   ███    ███ ███    ███   ███          ██   ",
      "     ▀▀█████▄    ▀▀███▀▀▀▀███▀  ▀▀███▀▀▀▀▀   ▀███████████ ███    ███ ▀███████████   ██   ",
      "       ███▐██▄     ███    ███   ▀███████████   ███    ███ ███    ███          ███   ██   ",
      "       ███ ▀███▄   ███    ███     ███    ███   ███    ███ ███    ███    ▄█    ███        ",
      "       ███   ▀█▀   ███    █▀      ███    ███   ███    █▀   ▀██████▀   ▄████████▀    ██   ",
      "       ▀                          ███    ███                                             ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file in git repo", ":Telescope git_files <CR>"),
      dashboard.button("r", "  > Recent", ":Telescope frecency<CR>"),
      dashboard.button("l", "🗘  > Open last session", ":SessionManager load_last_session<CR>"),
      dashboard.button("o", "  > Open session", ":SessionManager load_session<CR>"),
      dashboard.button("p", "  > Open project", ":Telescope projects<CR>"),
    }
    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

    require("alpha").setup(dashboard.opts)
  end,
}
