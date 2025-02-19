return {
	{
		"AstroNvim/astrocore",
		---@param opts AstroCoreOpts
		opts = {
			options = {
				opt = {
					showtabline = 0,
				},
			},
		},
	},
	plugins = {
		"AstroNvim/astrocommunity",
		{ import = "astrocommunity.pack.lua" },
		{ import = "astrocommunity.code-runner.sniprun" },
		{ import = "astrocommunity.pack.typescript" },
		{ import = "astrocommunity.pack.typescript-all-in-one" },
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
			-- colorscheme = "sonokai",
			-- colorscheme = "dracula",
			colorscheme = "monokai-pro-spectrum",
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
	{ "folke/tokyonight.nvim" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "maxmx03/dracula.nvim" },
	{ "sainnhe/sonokai" },
	{ "JoosepAlviste/palenightfall.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
		},
	},
	{
		"loctvl842/monokai-pro.nvim",
		opts = {
			filter = "octagon",
		},
	},
	{ "tpope/vim-surround" },
	{ "tpope/vim-fugitive" },
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
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			local status = require("astroui.status")
			opts.statusline = { -- statusline
				hl = { fg = "fg", bg = "bg" },
				status.component.mode({
					mode_text = { padding = { left = 1, right = 1 } },
				}), -- add the mode text
				status.component.file_info({
					filename = { fallback = "Empty" },
					filetype = false,
				}),
				status.component.git_diff(),
				status.component.diagnostics(),
				status.component.fill(),
				status.component.cmd_info(),
				status.component.fill(),
				status.component.git_branch(),
				status.component.lsp(),
				status.component.virtual_env(),
				status.component.treesitter(),
				status.component.nav(),
				-- remove the 2nd mode indicator on the right
			}
		end,
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
	{
		"nvim-neotest/neotest",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		cmds = {
			"Neotest run",
		},
		keys = {

			{ "<leader>t", "", desc = "+test" },
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File (Neotest)",
			},
			{
				"<leader>tT",
				function()
					require("neotest").run.run(vim.uv.cwd())
				end,
				desc = "Run All Test Files (Neotest)",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest (Neotest)",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run Last (Neotest)",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Summary (Neotest)",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true, auto_close = true })
				end,
				desc = "Show Output (Neotest)",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle Output Panel (Neotest)",
			},
			{
				"<leader>tS",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop (Neotest)",
			},
			{
				"<leader>tw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "Toggle Watch (Neotest)",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test ",
						jestConfigFile = "jest.config.js",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
				config = {
					output_panel = { open_on_run = true },
					diagnostic = true,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			handlers = {
				-- for prettier
				prettier = function()
					require("null-ls").register(require("null-ls").builtins.formatting.prettier.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
								or utils.root_has_file(".prettierrc")
								or utils.root_has_file(".prettierrc.json")
								or utils.root_has_file(".prettierrc.js")
						end,
					}))
				end,
				-- for prettierd
				prettierd = function()
					require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
								or utils.root_has_file(".prettierrc")
								or utils.root_has_file(".prettierrc.json")
								or utils.root_has_file(".prettierrc.js")
						end,
					}))
				end,
				-- For eslint_d:
				eslint_d = function()
					require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
								or utils.root_has_file(".eslintrc.json")
								or utils.root_has_file(".eslintrc.js")
						end,
					}))
				end,
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		config = function() end,
	},
	{
		"jpalardy/vim-slime",
		init = function()
			-- these two should be set before the plugin loads
			vim.g.slime_target = "tmux"
			vim.g.slime_no_mappings = true
		end,
		config = function()
			vim.g.slime_input_pid = false
			vim.g.slime_suggest_default = true
			vim.g.slime_menu_config = false
			vim.keymap.set("n", "<leader>r", "<Plug>Slime", { remap = true, silent = false })
			vim.keymap.set("n", "<leader>rr", "<Plug>SlimeLineSend", { remap = true, silent = false })
			vim.keymap.set("x", "<leader>r", "<Plug>SlimeRegionSend", { remap = true, silent = false })
			vim.keymap.set("n", "<leader>rc", "<Plug>Config", { remap = true, silent = false })
		end,
	},
}
