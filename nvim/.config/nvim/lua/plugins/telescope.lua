return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local bottom_pane_config = {
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 0.4,
				prompt_position = "bottom",
			},
			border = true,
			sorting_strategy = "descending",
			hidden = true,
		}

		require("telescope").setup({
			defaults = bottom_pane_config,
			extensions = {
				fzf = {},
				["ui-select"] = {},
			},
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git" },
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git" },
					hidden = true,
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
