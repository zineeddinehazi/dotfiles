return {
	{
		"ThePrimeagen/harpoon",
		-- Harpoon v1: do NOT set branch = "harpoon2"
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = {
			{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add file" },
			{ "<leader>m", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Harpoon menu" },

			{ "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon file 1" },
			{ "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon file 2" },
			{ "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon file 3" },
			{ "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon file 4" },
		},
	},
}
