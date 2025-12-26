return {
	"ibhagwan/fzf-lua",
	-- optional but common: gives icons in the picker
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({}) -- sane defaults
		local fzf = require("fzf-lua")
		vim.keymap.set("n", "<leader>ff", function()
			fzf.files()
		end, { desc = "Find files (fzf-lua)" })
		vim.keymap.set("n", "<leader>fg", function()
			fzf.live_grep()
		end, { desc = "Grep project (fzf-lua)" })
	end,
}
