"########################################################################################################################################################
"#                                                                                                                                                      #
"#       ,-.                               ,-.                                                                                                ____      #
"#   ,--/ /|                           ,--/ /|    ,--,                                                                      ,--,            ,'  , `.    #
"# ,--. :/ |                 ,---.   ,--. :/ |  ,--.'|       ,---.                ,---,                ,---.              ,--.'|         ,-+-,.' _ |    #
"# :  : ' /                 '   ,'\  :  : ' /   |  |,       '   ,'\           ,-+-. /  |              '   ,'\       .---. |  |,       ,-+-. ;   , ||    #
"# |  '  /          .--,   /   /   | |  '  /    `--'_      /   /   |         ,--.'|'   |    ,---.    /   /   |    /.  ./| `--'_      ,--.'|'   |  ||    #
"# '  |  :        /_ ./|  .   ; ,. : '  |  :    ,' ,'|    .   ; ,. :        |   |  ,"' |   /     \  .   ; ,. :  .-' . ' | ,' ,'|    |   |  ,', |  |,    #
"# |  |   \    , ' , ' :  '   | |: : |  |   \   '  | |    '   | |: :        |   | /  | |  /    /  | '   | |: : /___/ \: | '  | |    |   | /  | |--'     #
"# '  : |. \  /___/ \: |  '   | .; : '  : |. \  |  | :    '   | .; :        |   | |  | | .    ' / | '   | .; : .   \  ' . |  | :    |   : |  | ,        #
"# |  | ' \ \  .  \  ' |  |   :    | |  | ' \ \ '  : |__  |   :    |        |   | |  |/  '   ;   /| |   :    |  \   \   ' '  : |__  |   : |  |/         #
"# '  : |--'    \  ;   :   \   \  /  '  : |--'  |  | '.'|  \   \  /   ___   |   | |--'   '   |  / |  \   \  /    \   \    |  | '.'| |   | |`-'          #
"# ;  |,'        \  \  ;    `----'   ;  |,'     ;  :    ;   `----'   /  .\  |   |/       |   :    |   `----'      \   \ | ;  :    ; |   ;/              #
"# '--'           :  \  \            '--'       |  ,   /             \  ; | '---'         \   \  /                 '---"  |  ,   /  '---'               #
"#                 \  ' ;                        ---`-'               `--"                 `----'                          ---`-'                       #
"#                  `--`                                                                                                                                #
"#                                                                                                                                                      #
"########################################################################################################################################################




"#######################################################################################
" dein
"#######################################################################################

let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir = expand('~/.config/nvim/rc')
  let s:toml   = g:rc_dir . '/dein.toml'

  " TOMLを読み込み、キャッシュしておく
  call dein#load_toml(s:toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
  call dein#check_update(v:true)
endif

" plugin削除(rc/dein.toml)した時は下記を実行
" :call dein#recache_runtimepath()

" upgrade
" call dein#update()




"#######################################################################################
" General settings
"#######################################################################################

set fileformat=unix  " 改行コード
syntax enable  " シンタックス有効化

set number          " 行番号を表示
set title           " ターミナルにタイトルを設定する
set encoding=utf8   " uft-8
set updatetime=250  " 反映までの時間msec(default=4000)
set cindent         " 自動インデント

" set mouse=a  " マウスの有効化

" タブの幅
" expandtab   : タブキーをタイプしたときに、タブの代わりにスペースを入力
" shiftwidth  : Vimが自動的にインデントするときのスペースの数
" tabstop     : タブストップの間隔
" softtabstop : 見た目上の空白数
set filetype
augroup fileTypeIndent
  autocmd!
  autocmd FileType vim        setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType c,cpp      setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType python          setlocal expandtab tabstop=4 shiftwidth=4
  autocmd FileType toml            setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType html            setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType htmldjango      setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType asm             setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType sh              setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType fish            setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType java            setlocal expandtab tabstop=4 shiftwidth=4
  autocmd FileType xml             setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType javascript      setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType typescriptreact setlocal expandtab tabstop=2 shiftwidth=2
  autocmd FileType css             setlocal expandtab tabstop=2 shiftwidth=2
augroup END

set laststatus=2           " statuslineを常に表示
set wildmenu               " コマンドラインモードでの補完の有効化
set wildmode=list:longest  " コマンドラインの補完
set hlsearch               " 検索ハイライト有効
set history=20             " コマンドの履歴
set ruler                  " カーソルの位置をStatusBarに表示
set guicursor=             " insertモードでcursorの形を変えない(=空白 らしい)
set clipboard+=unnamed     " clipboardを使用




"#######################################################################################
" key mapping
"#######################################################################################

" noremap:  ノーマルモード、ビジュアルモードの再割り当てなしキーマッピング
" noremap!: コマンドラインモード、インサートモードの再割り当てなしキーマッピング
nnoremap <Up>   gk
nnoremap <Down> gj
nnoremap k gk
nnoremap j gj

" I am not vimmer
" noremap  <up>    <nop>
" noremap  <down>  <nop>
" noremap  <right> <nop>
" noremap  <left>  <nop>
" noremap! <up>    <nop>
" noremap! <down>  <nop>
" noremap! <right> <nop>
" noremap! <left>  <nop>




"#######################################################################################
" color scheme
"#######################################################################################

set termguicolors  " True color
set background=dark

colorscheme penny-lane




"#######################################################################################
" machakann/vim-highlightedyank
"#######################################################################################

" highlightの間隔(milliseconds,-1=永続)
let g:highlightedyank_highlight_duration = 300
" color
highlight HighlightedyankRegion guibg=#474d5c




"#######################################################################################
" vim-airline/vim-airline
"#######################################################################################

"color theme
let g:airline_theme = 'minimalist'

let g:airline#extensions#tabline#enabled = 1  "タブラインを表示
let g:airline_powerline_fonts = 1  " PowerLine Fontsを使用

" エラー対策(コメントアウトで問題なかったら消す)
let g:airline#extensions#disable_rtp_load=1




"#######################################################################################
" wfxr/minimap.vim
"#######################################################################################

function s:myMinimapToggle()
  "myMinimapToggle
  :MinimapToggle
  :MinimapRefresh
  :MinimapUpdateHighlight
endfunction
" space+mでminimap.vimを展開
nnoremap <silent><Space>m :call <SID>myMinimapToggle()<CR>

let g:minimap_auto_start = 0        " default=0
let g:minimap_width = 15            " default=10
let g:minimap_left = 0              " default=0(0:right),(1(left))
let g:minimap_highlight_range = 1   " 可視範囲をhighlight
let g:minimap_highlight_search = 1  " serch結果のhighlight
let g:minimap_git_colors = 1        " git変更部分のhighlight




"#######################################################################################
" airblade/vim-gitgutter
"#######################################################################################

" keymap
" ① sign,LINEをデフォルトで非表示にしてkeymapで切り替え
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
function s:myGitGutterToggle()
  " myGitGutterToggle
  :GitGutterSignsToggle
  :GitGutterLineHighlightsToggle
endfunction
" space+dでvim-gitgutterを展開
nnoremap <silent><Space>d :call <SID>myGitGutterToggle()<CR>

" ハイライトの変更
" columnのハイライト
highlight GitGutterAdd               gui=NONE  guifg=#00cc66  guibg=NONE     " g+
highlight GitGutterChange            gui=NONE  guifg=#ff8c00  guibg=NONE     " gm
highlight GitGutterDelete            gui=NONE  guifg=#ff0000  guibg=NONE     " g-
highlight GitGutterChangeDelete      gui=NONE  guifg=#f0f0f0  guibg=NONE
" LINEのハイライト
highlight GitGutterAddLine           gui=NONE  guifg=NONE     guibg=#39404f  " g+
highlight GitGutterChangeLine        gui=NONE  guifg=NONE     guibg=#39404f  " gm
highlight GitGutterDeleteLine        gui=NONE  guifg=NONE     guibg=#39404f  " g-
highlight GitGutterChangeDeleteLine  gui=NONE  guifg=NONE     guibg=#39404f

" 記号の変更
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'm'
let g:gitgutter_sign_removed = '-'

let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'




"#######################################################################################
" dense-analysis/ale
"#######################################################################################

let g:ale_lint_on_text_changed = 'alwayes'

let g:ale_sign_error = '✗✗'
let g:ale_sign_warning = ''
highlight ALEErrorSign   guibg=#2e373b guifg=#e73647
highlight ALEWarningSign guibg=#2e373b guifg=#e6b422

let g:ale_linters = {
  \ 'c': ['gcc'],
  \ 'cpp': ['gcc'],
  \ 'python': ['ruff']}
let g:ale_fixers = {"python": ["ruff", "ruff_format"]}
let g:opts = '-std=c++17 -Wall -Wextra'
let g:ale_cpp_cc_options    = opts
let g:ale_cpp_gcc_options   = opts
let g:ale_cpp_clang_options = opts

" フォーマットを変更
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%] %code: %%s'




"#######################################################################################
" neoclide/coc.nvim
"#######################################################################################

" tabでpopupを移動(↑:tab,↓:tab+shift)
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <silent> rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" coc extensions
let g:coc_global_extensions = [
  \'coc-clangd',
  \'coc-css',
  \'coc-docker',
  \'coc-fish',
  \'coc-html',
  \'coc-java',
  \'coc-json',
  \'coc-lists',
  \'coc-markdownlint',
  \'coc-pyright',
  \'coc-toml',
  \'coc-tsserver',
  \'coc-vimlsp',
  \'coc-xml',
  \'coc-yaml'
\]




"#######################################################################################
" junegunn/fzf.vim
"#######################################################################################

" ↓status barを上に反転
" let $FZF_DEFAULT_OPTS="--layout=reverse"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'rounded' } }

" key mapping
nnoremap <silent><Space>f :Files<CR>
nnoremap <silent><Space>g :GFiles<CR>
nnoremap <silent><Space>G :GFiles?<CR>
nnoremap <silent><Space>b :Buffers<CR>
nnoremap <silent><Space>h :History<CR>
nnoremap <silent><Space>c :Colors<CR>
"nnoremap <silent><Space>r :Rg<CR>




"#######################################################################################
" preservim/nerdtree
"#######################################################################################

"ctrl-wwでnerdtreeとエディターを移動する
" space+eでnerdtreeを展開
nnoremap <silent><Space>e :NERDTreeToggle<CR> 

let NERDTreeWinSize=25  " NerdTreeのwidth
let NERDTreeShowHidden = 1  " 隠しファイルを表示


"###########################################
" ryanoasis/vim-devicons
"###########################################

let g:webdevicons_enable_nerdtree = 1  " nerdfontの有効化(default=1)
let g:webdevicons_conceal_nerdtree_brackets = 1  " NERDTreeのアイコンの[](0→[icon],1→icon)
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '   " iconの後のスペース
let g:WebDevIconsUnicodeDecorateFolderNodes = 1  " unicode
let g:DevIconsEnableFoldersOpenClose = 1  " fileの開閉の動作
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" file-icons
" unicode(https://github.com/ryanoasis/nerd-fonts/tree/master/images)

" ① ファイル種類指定
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''  " →
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pem'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['slim'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['coffee'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = ''

" ② 完全一致指定
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''  " or' '
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.vimrc'] = ''  " →
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['ormconfig.js'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.env'] = 'ﭩ'
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['src'] = ''

" ③ パターンマッチ指定
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.vimrc'] = ''  " →
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.git'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.test.ts'] = 'ﭧ'


"###########################################
" tiagofumo/vim-nerdtree-syntax-highlight
"###########################################

" colors
let s:rspec_red = 'fe405f'
let s:git_orange = 'f54d27'
let s:green = '8faa54'

" ファイル名にも適用
let g:NERDTreeFileExtensionHighlightFullName = 1  " ① ファイル種類指定
let g:NERDTreeExactMatchHighlightFullName = 1     " ② 完全一致指定
let g:NERDTreePatternMatchHighlightFullName = 1   " ③ パターンマッチ指定

" 初期化
let g:NERDTreeExtensionHighlightColor = {}     " ① ファイル種類指定
let g:NERDTreeExactMatchHighlightColor = {}    " ② 完全一致指定
let g:NERDTreePatternMatchHighlightColor = {}  " ③ パターンマッチ指定

" ① ファイル種類指定
" ex)let g:NERDTreeExtensionHighlightColor['css'] = ''
let g:NERDTreeExtensionHighlightColor['cpp'] = s:git_orange

" ② 完全一致指定
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange

" ③ パターンマッチ指定
" ex)let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
let g:NERDTreePatternMatchHighlightColor['.vimrc'] = s:green
