return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
		ts.install({ "c", "cpp", "lua", "rust", "python" })
	end,
}

