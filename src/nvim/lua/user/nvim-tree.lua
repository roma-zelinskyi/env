local M = {
  "kyazdani42/nvim-tree.lua",
  commit = "f5d970d4506f385b29534252d8c15a782fa53034",
  event = "VimEnter",
}

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "V", api.node.open.vertical, opts "Open: Vertical Split")
  vim.keymap.set("n", "H", api.node.open.horizontal, opts "Open: Horizontal Split")
  vim.keymap.set("n", "<Tab>", api.node.open.preview, opts "Open Preview")
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

function M.config()
  local tree_cb = require("nvim-tree.config")
  require("nvim-tree").setup {
    on_attach = on_attach,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 40,
      side = "right",
    },
  }
end

return M
