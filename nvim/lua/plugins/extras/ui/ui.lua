return {
  -- drop
  -- {
  --   "folke/drop.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("drop").setup({
  --       theme = "leaves", -- leaves, snow, stars, xmas, spring, summer
  --       max = 30,
  --       screensaver = 1000 * 60 * 1, -- show after 2 minutes. Set to false, to disable
  --     })
  --   end,
  -- },
  --
  -- tailwind-colorizer-cmp
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      -- symbol = "▏",
      symbol = "╎",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
