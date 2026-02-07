return  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
      }, {
        { name = "buffer" },
      }),
    })

    -- cmdline 補完
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        completion = {
          border = "rounded", -- 枠線種類 ex: none, single, double, rounded, solid, shadow
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpMenuBorder",  -- ハイライトグループ設定
        },
        documentation = {
          border = "rounded", -- 枠線種類 ex: none, single, double, rounded, solid, shadow
          winhighlight = "NormalFloat:CmpDoc,FloatBorder:CmpDocBorder",  -- ハイライトグループ設定
        },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- Scroll documentation up
        ['<C-f>'] = cmp.mapping.scroll_docs(4),   -- Scroll documentation down
        ['<C-Space>'] = cmp.mapping.complete(),   -- Trigger completion menu
        ['<C-e>'] = cmp.mapping.abort(),          -- Close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      },
      {
        { name = 'buffer' },
      })
    })

     -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
     -- Set configuration for specific filetype.
     --[[ cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'git' },
       }, {
         { name = 'buffer' },
       })
    })
    require("cmp_git").setup() ]]--

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Set up lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- vim.lsp.config('<YOUR_LSP_SERVER>', {
    --   capabilities = capabilities,
    -- })
    -- vim.lsp.enable('pyright')

    -- Set up lspkind.
    local lspkind = require('lspkind')
    cmp.setup({
      formatting = {
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        format = lspkind.cmp_format({
          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            -- ...
            return vim_item
          end
        })
      }
    })
  end,
}

