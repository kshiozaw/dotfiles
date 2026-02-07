return {
  {
    "airblade/vim-gitgutter",
    keys = {
      {
        "<leader>d",
        function()
          vim.cmd("GitGutterSignsToggle")
          vim.cmd("GitGutterLineHighlightsToggle")
        end,
        silent = true,
        desc = "Toggle gitgutter signs & lines",
      },
    },
    init = function()
      -- デフォルトで非表示
      vim.g.gitgutter_signs = 0
      vim.g.gitgutter_highlight_lines = 0

      -- 記号の変更
      vim.g.gitgutter_sign_added = "+"
      vim.g.gitgutter_sign_modified = "m"
      vim.g.gitgutter_sign_removed = "-"
      vim.g.gitgutter_sign_removed_first_line = "^^"
      vim.g.gitgutter_sign_modified_removed = "ww"
    end,
    config = function()
      -- column のハイライト
      vim.cmd("highlight GitGutterAdd               gui=NONE guifg=#00cc66 guibg=NONE")
      vim.cmd("highlight GitGutterChange            gui=NONE guifg=#ff8c00 guibg=NONE")
      vim.cmd("highlight GitGutterDelete            gui=NONE guifg=#ff0000 guibg=NONE")
      vim.cmd("highlight GitGutterChangeDelete      gui=NONE guifg=#f0f0f0 guibg=NONE")

      -- line のハイライト
      vim.cmd("highlight GitGutterAddLine            gui=NONE guifg=NONE guibg=#39404f")
      vim.cmd("highlight GitGutterChangeLine         gui=NONE guifg=NONE guibg=#39404f")
      vim.cmd("highlight GitGutterDeleteLine         gui=NONE guifg=NONE guibg=#39404f")
      vim.cmd("highlight GitGutterChangeDeleteLine   gui=NONE guifg=NONE guibg=#39404f")
    end,
  },
}

