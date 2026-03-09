return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "powerline_dark",
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' }, 
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {
          'encoding',    -- Affiche 'utf-8'
          'fileformat',  -- Affiche l'icône de l'OS (unix, dos, mac)
          'filetype',    -- Type de fichier (cpp, lua, etc.)
        },
        lualine_y = { 'progress' },
        lualine_z = { 
		'location', 
		{ 'datetime', style = '%H:%M' }
	},
      },
    })
  end,
}
