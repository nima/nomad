local t = require("core.types")
global vim: t.vim.Vim

local M: t.plugins.PluginModule = {}

local record DBeerMod
  build: function(): nil
end

local type PluginSpec = t.plugins.PluginSpec
function M.lazy(): PluginSpec
  return {
    "javiorfo/nvim-dbeer",
    dependencies = {
        "javiorfo/nvim-popcorn",
        "javiorfo/nvim-spinetta",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    cmd = { "DBeerBuild" },
    ft = { "sql" },
    build = function()
        --+ Update backend on plugin change
        local _mod = "dbeer.core"
        local mod = (require(_mod) as DBeerMod)
        mod.build()
    end,
    keymaps = {},
    opts = {
        -- Default keymaps
        commands = {
            select_db = '<CR>',      --+ Keymap in Normal mode to select DB with command :DBeerDB
            expand_db = '<C-space>', --+ Keymap in Normal mode to expand and show connection data from DB with command :DBeerDB
            execute = '<C-t>',       --+ Keymap in Normal and Visual mode to execute a query
            close = '<C-c>',         --+ Keymap in Normal mode to close all buffer results
            scroll_left = '<C-h>',   --+ Keymap in Normal mode to scroll left dbeer query results
            scroll_rigth = '<C-l>',  --+ Keymap in Normal mode to scroll right dbeer query results
            scroll_down = '<C-j>',   --+ Keymap in Normal mode to scroll down dbeer query results
            scroll_up = '<C-k>',     --+ Keymap in Normal mode to scroll up dbeer query results
        },
        output --[[ Output buffer ]] = {
            dest_folder = "/tmp",       --+ Default dest folder where .dbeer files are created
            border_style = 3,           --+ 1 to 6
            header_style_link = "Type", --+ "hi link column style" in header table results
            buffer_height = 20,
            override = false,           --+ If false every query opens in a different buffer
        },
        db = dofile(os.getenv("RAKHSH_CONNECTIONS")),
        internal = { log_debug = false },
        view = { show_user = true, show_password = true, },
    }

  } as PluginSpec
end

return M
