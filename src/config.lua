-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--


vim.opt.relativenumber = true
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 3                          -- only the last window will always have a status line
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true                             -- display lines as one long line
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob = " "                     -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.linebreak = true

-- Indenting
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4   -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4      -- insert 2 spaces for a tab
vim.opt.softtabstop = 4
vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true  -- ignore case in search patterns
vim.opt.smartcase = true   -- smart case
vim.opt.smartindent = true -- make indenting smarter again

lvim.format_on_save.enabled = true

lvim.leader = "\\"

lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_config.height = 0.75
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"


lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.signcolumn = "yes"
lvim.builtin.nvimtree.setup.view.width = 40


-- Navigate buffers
lvim.keys.normal_mode["<S-l>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<S-q>"] = "<cmd>Bdelete!<CR>"
lvim.keys.normal_mode["<leader>1"] = ":BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<leader>2"] = ":BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<leader>3"] = ":BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<leader>4"] = ":BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<leader>5"] = ":BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<leader>6"] = ":BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<leader>7"] = ":BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<leader>8"] = ":BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<leader>9"] = ":BufferLineGoToBuffer 9<CR>"

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
-- lvim.plugins = {
--     {
--         'mrcjkb/rustaceanvim',
--         version = '^4', -- Recommended
--         lazy = false,   -- This plugin is already lazy
--     }
-- }

-- Insert --
-- Press qq fast to enter
lvim.keys.insert_mode["qq"] = "<ESC>"
lvim.keys.normal_mode["<S-q>"] = "<cmd>BufferKill<CR>"

-- Telescope
lvim.builtin.which_key.mappings["T"] = { "<cmd>Telescope<CR>", "Telescope" }
lvim.builtin.which_key.mappings["s"] = {
    name = "Search",
    f = { "<cmd>:Telescope find_files<CR>", "files" },
    g = { "<cmd>:Telescope live_grep<CR>", "live grep" },
    B = { "<cmd>:Telescope buffers<CR>", "buffers" },
    c = { "<cmd>:Telescope commands<CR>", "commands" },
    s = { "<cmd>:Telescope grep_string<CR>", "string" },
    m = { "<cmd>:Telescope marks<CR>", "marks" },
    b = { "<cmd>:Telescope current_buffer_fuzzy_find<CR>", "current buffer" },
    h = { "<cmd>:Telescope search_history<CR>", "history" },
    l = { "<cmd>Telescope resume<cr>", "resume last search" },
    r = { "<cmd>Telescope oldfiles<cr>", "recent files" },
}
