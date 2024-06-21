return {
	options = {
		opt = {
			showtabline = 0,
		},
	},
	plugins = {
		"AstroNvim/astrocommunity",
		{ import = "astrocommunity.pack.lua" },
		{ import = "astrocommunity.code-runner.sniprun" },
	},
	{
		"AstroNvim/astroui",
		-- -@type AstroUIOpts
		opts = {
			status = {
				-- Configure attributes of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names, this applies to colors that have `_fg` and/or `_bg` names with the suffix removed (ex. `git_branch_fg` as attributes from `git_branch`).
				attributes = {
					git_branch = { bold = true },
				},
				-- Configure colors of components defined in the `status` API. Check the AstroNvim documentation for a complete list of color names.
				colors = {
					git_branch_fg = "#ABCDEF",
				},
				-- Configure which icons that are highlighted based on context
				icon_highlights = {
					-- enable or disable breadcrumb icon highlighting
					breadcrumbs = true,
					-- Enable or disable the highlighting of filetype icons both in the statusline and tabline
					file_icon = {
						tabline = function(self)
							return self.is_active or self.is_visible
						end,
						statusline = true,
					},
				},
				-- Configure characters used as separators for various elements
				separators = {
					none = { "", "" },
					left = { "", "  " },
					right = { "  ", "" },
					center = { "  ", "  " },
					tab = { "", "" },
					breadcrumbs = "  ",
					path = "  ",
				},
				-- Configure enabling/disabling of winbar
				winbar = {
					enabled = { -- whitelist buffer patterns
						filetype = { "gitsigns.blame" },
					},
					disabled = { -- blacklist buffer patterns
						buftype = { "nofile", "terminal" },
					},
				},
			},
			colorscheme = "sonokai",
			-- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
			-- Icons can be configured throughout the interface
			icons = {
				-- configure the loading of the lsp in the status line
				LSPLoading1 = "⠋",
				LSPLoading2 = "⠙",
				LSPLoading3 = "⠹",
				LSPLoading4 = "⠸",
				LSPLoading5 = "⠼",
				LSPLoading6 = "⠴",
				LSPLoading7 = "⠦",
				LSPLoading8 = "⠧",
				LSPLoading9 = "⠇",
				LSPLoading10 = "⠏",
			},
		},
	},
	{
		"sainnhe/sonokai",
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
		},
		opts = function(_, config)
			local null_ls = require("null-ls")

			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.prettierd,
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
			}
			return config
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"javascript",
				"typescript",
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
