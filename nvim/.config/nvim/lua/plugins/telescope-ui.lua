return {
	-- Make vim.ui.select use Telescope (affects LSP code actions picker)
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
