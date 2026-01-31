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

## 1. nerdfontの設定

下記を実行して[ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)からnerd font(DroidSansMono)をダウンロードする。

```shell
mkdir -p [fontsディレクトリ]
cd [fontsディレクトリ] && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

端末のfontを`DroidSansMono`に設定する。

## 2. penny-laneをインストール

カラースキームで`penny-lane.vim`を使用するために、`nvim/colors/`に[kyokio6002/penny-lane](https://github.com/kyokio6002/penny-lane)をダウンロードする。


# refaerences

[【Mac】Lazy.nvimでPythonとLuaのLSP環境を構築する方法 – ナミレリブログ](https://namileriblog.com/mac/lazy_nvim_lsp/#google_vignette)
