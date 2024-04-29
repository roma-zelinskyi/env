local M = {
  "desdic/telescope-rooter.nvim",
  event = "VimEnter",
  branch = "main",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
      lazy = true,
    },
    {
      "nvim-telescope/telescope.nvim",
      event = "Bufenter",
      cmd = { "Telescope" },
    },
  },
}


function M.config()
require("telescope").extensions = {
    rooter = {
       enable = true,
       patterns = { ".git" },
       debug = false
    }
}
end

return M
