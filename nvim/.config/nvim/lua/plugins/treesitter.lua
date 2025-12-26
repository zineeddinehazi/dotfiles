return {

	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	config = function()
		require("nvim-treesitter").install({
			"go",
			"gomod",
			"gosum",
			"gowork",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
			"html",
			"css",
			"json",
			"yaml",
			"rust",
		})
	end,
}
