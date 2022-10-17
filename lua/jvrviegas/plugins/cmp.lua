local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-s>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          buffer = "[Buffer]",
          luasnip = "[Snippet]",
          treesitter = "[Treesitter]",
          path = "[Path]",
          cmp_tabnine = "[Tabnine]",
        })[entry.source.name]

        return vim_item
      end
    })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
