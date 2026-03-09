--Options 
vim.opt.number = true          -- Affiche le num�ro de la ligne actuelle
vim.opt.relativenumber = true  -- Affiche la distance par rapport � ton curseur (tr�s utile pour les sauts)
vim.opt.mouse = 'a'            -- Active la souris (pratique pour redimensionner les panes au d�but)
vim.opt.ignorecase = true      -- Ignore la casse lors d'une recherche...
vim.opt.smartcase = true       -- ...sauf si tu mets une majuscule
vim.opt.termguicolors = true   -- Active les "vraies" couleurs (n�cessaire pour la plupart des th�mes)
vim.opt.splitbelow = true       -- Force le split horizontal vers le bas
vim.opt.splitright = true        -- Force le split vertical vers la droite


--Clipboard setup
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

vim.opt.clipboard = "unnamedplus"

--Raccourcis
vim.g.mapleader = " "

vim.keymap.set('n', '<C-Left>',  '<C-w>h')
vim.keymap.set('n', '<C-Down>',  '<C-w>j')
vim.keymap.set('n', '<C-Up>',    '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

vim.keymap.set("n","<leader>pv", vim.cmd.Ex)
-- Terminal 
vim.keymap.set('t', '<C-Left>',  [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<C-Down>',  [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<C-Up>',    [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<C-Right>', [[<C-\><C-n><C-w>l]])

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })

-- Telescope
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Telescope find fichiers" })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Telescope recherche texte" })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = "Telescope aide" })
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = "Telescope fichiers récents" })
vim.keymap.set('n', '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = "Recherche dans le fichier" })
vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').find_files({ prompt_title = "Config & Home",cwd = vim.fn.expand("~"),hidden = true,}) end, { desc = "Chercher dans Home/Configs" })

--Trouble

-- Configure LSP clients

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

vim.lsp.config('clangd', {
  cmd = { 
    'clangd', 
    '--background-index', 
    '--clang-tidy',
    '--header-insertion=iwyu'
  },
  	filetypes = { 'c', 'cpp'},
})

-- Activer le serveur pour le C/C++
vim.lsp.enable('clangd')

--Raccourcis LSP
vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

-- Layout IDE : Sidebar + Terminal
local function toggle_ide()
    local tree_api = require("nvim-tree.api")
    local tree_view = require("nvim-tree.view")

    if tree_view.is_visible() then
        tree_api.tree.close()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == 'terminal' then
                vim.api.nvim_win_close(win, true)
            end
        end
    else
        vim.cmd('NvimTreeOpen')
        vim.cmd('wincmd h') 
        vim.cmd('belowright split | term')
	vim.opt_local.number = false         
	vim.opt_local.relativenumber = false
        
        local ui = vim.api.nvim_list_uis()[1]
        local term_height = math.floor(ui.height * 0.5) -- On repasse � 0.3 (30%) pour tester
        
        vim.cmd('resize ' .. term_height)
        vim.cmd('startinsert')
    end
end

vim.keymap.set('n', '<leader>e', toggle_ide, { desc = "Toggle IDE Layout" })

--Requires
require("config.lazy")
