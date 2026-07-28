-- mason.nvim: LSP,linter,formatterなどの外部ツールを簡単にインストール・管理するためのNeovimプラグイン
-- mason-lspconfig.nvim: mason.nvimでインストールしたパッケージ名をLSPサーバー名に対応付けるプラグイン
-- nvim-lspconfig: 各LSPサーバーのデフォルト定義(lsp/*.lua)を提供するプラグイン
-- mason-null-ls.nvim: mason.nvimの拡張機能で、null-ls.nvimと自動的に連携するためのプラグイン
-- none-ls.nvim: LSP以外のlinterやformatterをLSP clientとして利用できるようにするためのプラグイン
--
-- Neovim v0.11以降、LSPの設定はビルトインのvim.lsp.config()/vim.lsp.enable()で行う。
-- 旧来のrequire("lspconfig")["server"].setup()はnvim-lspconfig v3.0.0で削除される。

local lsp_servers = {
  "pyright",
  "ruff",
  "bashls",
  "lua_ls",
  "yamlls",
  "jsonls",
  "taplo",
  "rust_analyzer",
  "ts_ls",
  "html",
  "cssls",
}

-- サーバーごとの追加設定。nvim-lspconfigのデフォルト定義(cmd/filetypes/root_markers/settings)に
-- 上書きマージされるので、変更したい項目だけ書けばよい。
--
-- 注: 設定を {config}/lsp/<name>.lua に置く方法もあるが、runtimepathの後に来るものが
--     優先されるため、rtp先頭の~/.config/nvimに置いてもnvim-lspconfig側に上書きされてしまう。
--     nvim-lspconfigを併用する構成ではこちらのvim.lsp.config()を使う。
local lsp_overrides = {
  -- 例:
  -- lua_ls = {
  --   settings = { Lua = { diagnostics = { globals = { "vim" } } } },
  -- },
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
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
      "hrsh7th/cmp-nvim-lsp",
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
        ensure_installed = lsp_servers,
        -- 有効化は下のvim.lsp.enable()で明示的に行う。
        -- 自動有効化を残すと設定が二重に適用されクライアントが重複起動する。
        automatic_enable = false,
      })

      -- 全サーバー共通の設定。nvim-cmpの補完能力(スニペット展開など)をLSPに伝える
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      for server, opts in pairs(lsp_overrides) do
        vim.lsp.config(server, opts)
      end

      vim.lsp.enable(lsp_servers)
    end,
  },

  -- none-ls.nvim / mason-null-ls.nvim setup
  {
    "jay-babu/mason-null-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
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
