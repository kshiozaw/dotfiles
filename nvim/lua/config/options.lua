-- ########################################################################################
-- # General settings
-- ########################################################################################

vim.opt.fileformat = "unix"

vim.opt.number = true      -- 行番号の表示
vim.opt.title = true       -- タイトルバーにファイル名を表示
vim.opt.updatetime = 250   -- 反映までの時間msec(default=4000)
vim.opt.cindent = true     -- 自動インデント

-- vim.opt.mouse = "a"        -- マウスの有効化

-- タブの幅
-- expandtab   : タブキーをタイプしたときに、タブの代わりにスペースを入力
-- shiftwidth  : Vimが自動的にインデントするときのスペースの数
-- tabstop     : タブストップの間隔
-- softtabstop : 見た目上の空白数
local indent_group = vim.api.nvim_create_augroup("FileTypeIndent", { clear = true })

local function set_indent(ft, opts)
  vim.api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = ft,
    callback = function()
      vim.opt_local.expandtab = true
      vim.opt_local.tabstop = opts
      vim.opt_local.shiftwidth = opts
    end,
  })
end

set_indent({ "vim", "c", "cpp", "toml", "html", "htmldjango", "asm", "sh", "fish", "xml", "javascript", "typescriptreact", "css", "lua" }, 2)
set_indent({ "python", "java" }, 4)

vim.opt.laststatus = 2 	 -- statuslineを常に表示
vim.opt.wildmenu = true        -- コマンドラインモードでの補完の有効化
vim.opt.wildmode = "list:longest"  -- コマンドラインの補完
vim.opt.hlsearch = true        -- 検索ハイライト有効
vim.opt.history = 20          -- コマンドの履歴
vim.opt.ruler = true          -- カーソルの位置をStatusBarに表示
vim.opt.guicursor = ""        -- insertモードでcursorの形を変えない(=空白 らしい)
vim.opt.clipboard:append("unnamed")  -- clipboardを使用



-- ########################################################################################
-- # key mapping
-- ########################################################################################

-- 表示行単位で移動
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")



-- ########################################################################################
-- # color scheme
-- ########################################################################################

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme penny-lane")
