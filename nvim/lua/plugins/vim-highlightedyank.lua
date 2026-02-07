return {
  {
    "machakann/vim-highlightedyank",
    event = "TextYankPost", -- yank 時だけロード（最適）
    init = function()
      -- highlight の表示時間（ms, -1 = 永続）
      vim.g.highlightedyank_highlight_duration = 300
    end,
    config = function()
      -- ハイライト定義
      vim.cmd("highlight HighlightedyankRegion guibg=#474d5c")
    end,
  },
}

