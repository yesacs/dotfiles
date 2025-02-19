return {
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
		{ "<leader>tr", "<cmd>Neotest run <cr>", desc = "run nearest test" },
		{ "<leader>tl", "<cmd>Neotest run last<cr>", desc = "run last test" },
		{ "<leader>tf", "<cmd>Neotest run file<cr>", desc = "run test file" },
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm run test ",
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
}
