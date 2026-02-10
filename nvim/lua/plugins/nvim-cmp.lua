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
    local lspkind = require('lspkind')

    -- Single consolidated cmp.setup with all configurations
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpMenuBorder",
        },
        documentation = {
          border = "rounded",
          winhighlight = "NormalFloat:CmpDoc,FloatBorder:CmpDocBorder",
        },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        format = lspkind.cmp_format({
          maxwidth = {
            menu = 50,
            abbr = 50,
          },
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function (entry, vim_item)
            return vim_item
          end
        })
      }
    })

    -- cmdline completion for search
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- cmdline completion for command mode
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end,
}

