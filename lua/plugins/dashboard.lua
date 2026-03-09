return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
				week_header = { enable = true },
				shortcut = {
					{ desc = "󰊄 Projets", group = "@property", action = "Telescope find_files", key = "p" },
					{ desc = " Nouveau", group = "DiagnosticHint", action = "ene | startinsert", key = "n" },
					{ desc = "󰒲 Lazy", group = "DiagnosticWarn", action = "Lazy", key = "l" },
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
