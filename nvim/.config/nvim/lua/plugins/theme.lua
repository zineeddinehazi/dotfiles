-- Rose Pine ---------------------------------------------------------------------
--[[return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
	end
}]]

-- One Dark Pro --------------------------------------------------------------------
--[[return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme onedark")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
	end
	}]]

--Dracula Blood --------------------------------------------------------------------
return {
	'ray-x/starry.nvim',
	config = function()
		require('starry').setup({
			style = {
				name = 'dracula_blood',
			},
		})
		vim.cmd('colorscheme dracula_blood')

		-- Enable true colors (required for hex backgrounds)
		vim.o.termguicolors = true

		-- Enable transparent look
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })

		-- Override Pmenu highlights (dark gray bg example)
		vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#191A1A' })
		vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#3a3a3a' })
	end
}
