local Util = require("lazyvim.util")
return {
  { import = "plugins.extras.ui.ui" },

  -- bufferline disable
  { "akinsho/bufferline.nvim", enabled = false },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus
      return {
        options = {
          theme = "tokyonight",
          globalstatus = true,
          disabled_filetypes = { statusline = { "alpha", "starter" } },
        },
        sections = {
          lualine_b = {
            "buffers",
          },
          lualine_c = {
            "branch",
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {},
          lualine_y = {
            Util.lualine.root_dir(),
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = Util.ui.fg("Debug"),
            },
          },

          lualine_z = { "location" },
        },
      }
    end,
  },

  -- noice
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      routes = {
        {
          view = "cmdline",
          filter = { event = "msg_showmode" },
        },
      },
    },
  },

  -- notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      background_colour = "#000000",
      stages = "fade",
      render = "compact",
    },
  },

  --   -- dashboard
  -- { "nvimdev/dashboard-nvim", enabled = false },
  {
    "nvimdev/dashboard-nvim",
    event = "vimEnter",
    opts = function(_, opts)
      --  https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=
      local logo = [[
       ▄▄▄▄    ▄▄▄      ▓█████▄  ▄▄▄       ██▓
▓█████▄ ▒████▄    ▒██▀ ██▌▒████▄    ▓██▒
▒██▒ ▄██▒██  ▀█▄  ░██   █▌▒██  ▀█▄  ▒██▒
▒██░█▀  ░██▄▄▄▄██ ░▓█▄   ▌░██▄▄▄▄██ ░██░
░▓█  ▀█▓ ▓█   ▓██▒░▒████▓  ▓█   ▓██▒░██░
░▒▓███▀▒ ▒▒   ▓▒█░ ▒▒▓  ▒  ▒▒   ▓▒█░░▓  
▒░▒   ░   ▒   ▒▒ ░ ░ ▒  ▒   ▒   ▒▒ ░ ▒ ░
 ░    ░   ░   ▒    ░ ░  ░   ░   ▒    ▒ ░
 ░            ░  ░   ░          ░  ░ ░  
  ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  --
  -- zen mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
