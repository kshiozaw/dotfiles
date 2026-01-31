-- lua/plugins/ale.lua
return {
  "dense-analysis/ale",
  init = function()
    -- lint のタイミング
    vim.g.ale_lint_on_text_changed = "always"

    -- サイン
    vim.g.ale_sign_error = "✗✗"
    vim.g.ale_sign_warning = ""

    -- linters / fixers
    vim.g.ale_linters = {
      c = { "gcc" },
      cpp = { "gcc" },
      python = { "ruff" },
    }

    vim.g.ale_fixers = {
      python = { "ruff", "ruff_format" },
    }

    -- C/C++ オプション
    local opts = "-std=c++17 -Wall -Wextra"
    vim.g.ale_cpp_cc_options = opts
    vim.g.ale_cpp_gcc_options = opts
    vim.g.ale_cpp_clang_options = opts

    -- echo メッセージのフォーマット
    vim.g.ale_echo_msg_error_str = "E"
    vim.g.ale_echo_msg_warning_str = "W"
    vim.g.ale_echo_msg_format = "[%linter%][%severity%] %code: %%s"
  end,

  config = function()
    -- highlight は colorscheme に上書きされるので autocmd で
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "ALEErrorSign", {
          fg = "#e73647",
          bg = "#2e373b",
        })
        vim.api.nvim_set_hl(0, "ALEWarningSign", {
          fg = "#e6b422",
          bg = "#2e373b",
        })
      end,
    })
  end,
}

