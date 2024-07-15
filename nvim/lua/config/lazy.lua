local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its pluginsj
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- NOTE: dap { extras }
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },

    -- HACK: go language
    { import = "lazyvim.plugins.extras.lang.go" },

    -- docker
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- markdown
    -- { import = "lazyvim.plugins.extras.lang.markdown" },

    -- python
    { import = "lazyvim.plugins.extras.lang.python" },

    -- terraform
    { import = "lazyvim.plugins.extras.lang.terraform" },

    -- Typescript
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- YAML
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- JSON
    { import = "lazyvim.plugins.extras.lang.json" },

    -- tailwind-css
    { import = "lazyvim.plugins.extras.lang.tailwind" },

    -- ESLINT
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- prettier
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- UI
    { import = "lazyvim.plugins.extras.ui.edgy" },

    -- vscode
    { import = "lazyvim.plugins.extras.vscode" },

    -- neotest
    { import = "lazyvim.plugins.extras.test.core" },

    -- rust
    { import = "lazyvim.plugins.extras.lang.rust" },

    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
