-- mason.nvim: LSP,linter,formatterなどの外部ツールを簡単にインストール・管理するためのNeovimプラグイン
-- mason-lspconfig.nvim: mason.nvimの拡張機能で、mason.nvimとnvim-lspconfigと自動的に連携するためのプラグイン
-- nvim-lspconfig: LSPをNeovimに簡単に設定・管理するためのプラグイン
-- mason-null-ls.nvim: mason.nvimの拡張機能で、null-ls.nvimと自動的に連携するためのプラグイン
-- none-ls.nvim: LSP以外のlinterやformatterをLSP clientとして利用できるようにするためのプラグイン

local lsp_servers = {
  pyright = {
    root_dir = function(fname)
      local lspconfig = require("lspconfig")
      return lspconfig.util.root_pattern(
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git"
      )(fname)
    end,
  },
  ruff = {},
  bashls = {},
  lua_ls = {},
  yamlls = {},
  jsonls = {},
  taplo = {},
  rust_analyzer = {},
  ts_ls = {},
  html = {},
  cssls = {},
}

local formatters = {
  -- "prettierd",  -- for JavaScript/TypeScript formatting
  -- "stylua",     -- for Lua formatting
  -- "eslint_d",   -- for JavaScript/TypeScript linting
  "black",      -- for Python formatting
  "isort",      -- for Python import sorting
  -- "flake8",     -- for Python linting
  -- "gofmt",      -- for Go formatting
  -- "golangci-lint",  -- for Go linting
}

local diagnostics = {
  -- Add any diagnostic tools you want to ensure are installed
}

return {
  -- mason.nvim / mason-lspconfig.nvim / lspconfig setup
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(lsp_servers),
      })

      local lspconfig = require("lspconfig")
      local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      for server, opts in pairs(lsp_servers) do
        opts.capabilities = cmp_capabilities

        -- root_dirが未定義の場合のデフォルト設定
        if not opts.root_dir then
          opts.root_dir = function(fname)
            return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
          end
        end
        lspconfig[server].setup(opts)
      end
    end,
  },

  -- none-ls.nvim / mason-null-ls.nvim setup
  {
    "jay-babu/mason-null-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      -- formatters table
      local formatters_sources = {}
      for _, formatter in ipairs(formatters) do
        table.insert(formatters_sources, null_ls.builtins.formatting[formatter])
      end

      -- diagnostics table
      local diagnostics_sources = {}
      for _, diagnostic in ipairs(diagnostics) do
        table.insert(diagnostics_sources, null_ls.builtins.diagnostics[diagnostic])
      end

      -- none-ls setup
      null_ls.setup({
        diagnostics_format = "[#{m}] #{s} (#{c})",
        sources = vim.list_extend(formatters_sources, diagnostics_sources),
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
}
