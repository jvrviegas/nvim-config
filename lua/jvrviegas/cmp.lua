local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- lspkind
lspkind.init({
	mode = "symbol_text",
	preset = "codicons",
})

-- nvim-autopairs
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- nvim-cmp setup
cmp.setup({
	formatting = {
		format = function(entry, vim_item)
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
		end,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-s>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "cmp_tabnine" },
		{ name = "luasnip" },
		{ name = "treesitter" },
		{ name = "path" },
		{ name = "buffer" },
	},
})
