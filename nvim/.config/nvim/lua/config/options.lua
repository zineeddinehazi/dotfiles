vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.diagnostic.config({
	virtual_text = true, -- inline text
	signs = true, -- gutter signs
	underline = true, -- underline the problem
	update_in_insert = true, -- show updates while typing
	severity_sort = true,
})
