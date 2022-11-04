```
                                                                             ____     
                                                           ,--,            ,'  , `.   
                 ,---,                ,---.              ,--.'|         ,-+-,.' _ |   
             ,-+-. /  |              '   ,'\       .---. |  |,       ,-+-. ;   , ||   
            ,--.'|'   |    ,---.    /   /   |    /.  ./| `--'_      ,--.'|'   |  ||   
           |   |  ,"' |   /     \  .   ; ,. :  .-' . ' | ,' ,'|    |   |  ,', |  |,   
           |   | /  | |  /    /  | '   | |: : /___/ \: | '  | |    |   | /  | |--'    
           |   | |  | | .    ' / | '   | .; : .   \  ' . |  | :    |   : |  | ,       
           |   | |  |/  '   ;   /| |   :    |  \   \   ' '  : |__  |   : |  |/        
           |   | |--'   '   |  / |  \   \  /    \   \    |  | '.'| |   | |`-'         
           |   |/       |   :    |   `----'      \   \ | ;  :    ; |   ;/             
           '---'         \   \  /                 '---"  |  ,   /  '---'              
                          `----'                          ---`-'
```

# neovim setup

# 1.nerdfontの設定

下記を実行して[ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)からnerd font(DroidSansMono)をダウンロードする。

```shell
mkdir -p [fontsディレクトリ]
cd [fontsディレクトリ] && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

```

端末のfontを`DroidSansMono`に設定する。

# 2.penny-laneをインストール

カラースキームで`penny-lane.vim`を使用するために、`nvim/colors/`に[kyokio6002/penny-lane](https://github.com/kyokio6002/penny-lane)をダウンロードする。

# 3.nodejsをインストールする

[neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)を使用するために`nodejs`をインストールする。

# 4.code-minimapをインストールする

[wfxr/minimap.vim](https://github.com/wfxr/minimap.vim)に使用するために[wfxr/code-minimap](https://github.com/wfxr/code-minimap)をインストールする。
