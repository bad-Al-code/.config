return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      dim_inactive = true,
      hide_inactive_statusline = false,
    },
  },
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "frappe", -- latte, frappe, macchiato, mochacol
  --       transparent_background = true,
  --       show_end_of_buffer = false,
  --
  --       integrations = {
  --         dashboard = true,
  --         leap = true,
  --         indent_blankline = true,
  --         mason = true,
  --         markdown = true,
  --         treesitter = true,
  --         treesitter_context = true,
  --         which_key = true,
  --         noice = true,
  --         cmp = true,
  --         gitsigns = true,
  --         nvimtree = true,
  --         telescope = true,
  --         notify = true,
  --         mini = true,
  --       },
  --       color_overrides = {
  --         mocha = {
  --           base = "#000000",
  --           mantle = "#000000",
  --           crust = "#000000",
  --         },
  --       },
  --     })
  --     vim.cmd("colorscheme catppuccin")
  --   end,
  -- },

  -- {
  --   "sainnhe/sonokai",
  --   priority = 1000,
  --   config = function()
  --     vim.g.sonokai_transparent_background = 2
  --     vim.g.sonokai_enable_italic = 1
  --     vim.g.sonokai_style = "andromeda"
  --     vim.g.sonokai_float_style = "dim"
  --     vim.cmd("colorscheme sonokai")
  --   end,
  -- },
}
