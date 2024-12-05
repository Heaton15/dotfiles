return {
	{
		"jbyuki/venn.nvim",
		config = function()
			function _G.Toggle_venn()
				local venn_enabled = vim.inspect(vim.b.venn_enabled)
				if venn_enabled == "nil" then
					vim.b.venn_enabled = true
					vim.cmd([[setlocal ve=all]])
					-- draw a line on HJKL keystokes
					vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
					-- draw a box by pressing "f" with visual selection
					vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
					vim.api.nvim_buf_set_keymap(0, "v", "o", ":VBoxO<CR>", { noremap = true })
				else
					vim.cmd([[setlocal ve=]])
					vim.cmd([[mapclear <buffer>]])
					vim.b.venn_enabled = nil
				end
			end
			vim.keymap.set("n", "<leader>ve", ":lua Toggle_venn()<CR>", { noremap = true })
		end,
	},
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},
	{
		"dhruvasagar/vim-table-mode",
		event = "VeryLazy",
		config = function()
			local ft = vim.bo.filetype
			if ft == "rst" then
				vim.g.table_mode_corner_corner = [[+]]
				vim.g.table_mode_header_fillchar = [[=]]
			elseif ft == "markdown" then
				vim.cmd("let b:table_mode_corner = '|'")
			end
		end,
	},

	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local feedkey = function(key, mode)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
			end

			vim.cmd([[set completeopt=menu,menuone,noselect]])

			local cmp = require("cmp")
			local select_opts = { behavior = cmp.SelectBehavior.Select }
			return {
				-- In some cases, the selection is auto filled in even though I
				-- haven't called cmp.select_next_item(). This prevents the autofill
				-- from occurring.
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					--['<C-o>'] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					-- trying this without select = true because we can't <CR> in insert
					-- mode without autocompleting junk. Maybe there is a better way,
					-- but idk
					["<CR>"] = cmp.mapping.confirm(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
}
