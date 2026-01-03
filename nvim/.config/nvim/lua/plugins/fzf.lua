return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons" },
	---@module "fzf-lua"
	---@type fzf-lua.Config|{}
	---@diagnostic disable: missing-fields
	config = function()
		require("fzf-lua").setup {
			keymap = {
				vim.api.nvim_set_keymap('n', '<leader>ff', [[<Cmd>lua require('fzf-lua').files()<CR>]], {}),
				vim.api.nvim_set_keymap('n', '<leader>fg', [[<Cmd>lua require('fzf-lua').live_grep()<CR>]], {})
			},
		}
	end
	---@diagnostic enable: missing-fields
}
