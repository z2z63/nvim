return {
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"neovim/nvim-lspconfig",
		version = "*",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"lazy.nvim",
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"windwp/nvim-autopairs",
		},
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
		config = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			cmp.setup({
				view = {
					entries = "custom", -- can be "custom", "wildmenu" or "native"
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
			})
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
			-- require("lspconfig").jdtls.setup({
			-- 	capabilities = capabilities,
			-- })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", config = true },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<C-A-l>",
				function()
					vim.print("<A-l>, formating...")
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.api.nvim_create_user_command("Format", function(args)
				vim.print("Format command...")
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			delay = 500,
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		opts = {
			defaults = {
				border = false,
			},
		},
		config = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	}, -- nvim v0.8.0
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"JavaHello/spring-boot.nvim",
		ft = { "java", "yaml", "jproperties" },
		dependencies = {
			"neovim/nvim-lspconfig", -- or nvim-java, nvim-lspconfig
			-- "ibhagwan/fzf-lua", -- 可选，用于符号选择等UI功能。也可以使用其他选择器（例如 telescope.nvim）。
		},
		---@type bootls.Config
		opts = {},
	},
}
