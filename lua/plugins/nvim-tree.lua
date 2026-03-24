return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))

			vim.keymap.set("n", "<C-l>", api.tree.change_root_to_node, opts("CD"))
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			renderer = {
				indent_markers = {
					enable = true,
				},
				highlight_modified = "all",
			},
			view = {
				width = "25%",
				side = "left",
				signcolumn = "yes",
			},
			filters = { dotfiles = false },
		})
	end,
}
