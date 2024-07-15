return {
  { import = "plugins.extras.coding.coding" },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- lspsaga.nvim
  -- {
  --   "glepnir/lspsaga.nvim",
  --   lazy = false,
  --   config = function()
  --     require("lspsaga").setup({
  --       -- keybinds for navigation in lspsaga window
  --       move_in_saga = { prev = "<C-k>", next = "<C-j>" },
  --       -- use enter to open file with finder
  --       finder_action_keys = {
  --         open = "<CR>",
  --       },
  --       -- use enter to open file with definition preview
  --       definition_action_keys = {
  --         edit = "<CR>",
  --       },
  --     })
  --   end,
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },

  -- cloak nvim
  -- {
  --   "laytan/cloak.nvim",
  --   lazy = false,
  --   config = function()
  --     require("cloak").setup({
  --       enabled = true,
  --       cloak_character = "*",
  --       -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
  --       highlight_group = "Comment",
  --       -- Applies the length of the replacement characters for all matched
  --       -- patterns, defaults to the length of the matched pattern.
  --       cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
  --       -- Whether it should try every pattern to find the best fit or stop after the first.
  --       try_all_patterns = true,
  --       -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
  --       cloak_telescope = true,
  --       patterns = {
  --         {
  --           -- Match any file starting with '.env'.
  --           -- This can be a table to match multiple file patterns.
  --           file_pattern = ".env*",
  --           -- Match an equals sign and any character after it.
  --           -- This can also be a table of patterns to cloak,
  --           -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
  --           cloak_pattern = "=.+",
  --           -- A function, table or string to generate the replacement.
  --           -- The actual replacement will contain the 'cloak_character'
  --           -- where it doesn't cover the original text.
  --           -- If left empty the legacy behavior of keeping the first character is retained.
  --           replace = nil,
  --         },
  --       },
  --     })
  --   end,
  -- },
}
