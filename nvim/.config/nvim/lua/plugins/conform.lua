return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 3000,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				-- Web (use prettier or prettierd)
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" }, -- jsx
				typescriptreact = { "prettierd", "prettier" }, -- tsx

				-- Go / Python / Lua / Rust
				go = { "gofmt" },
				python = { "black" },
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
		})
	end,
}
