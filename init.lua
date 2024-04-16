-- vim

vim.wo.relativenumber = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- lazy.vim 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- additional plugins
require("lazy").setup({
	-- colorscheme
	{

		"rose-pine/neovim",
		config=function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	-- telescope
	{
		'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
	},
	{
		"nvim-lua/plenary.nvim"
	},
	{ 
		"BurntSushi/ripgrep"
	},
	{
  		'nvim-telescope/telescope.nvim', tag = '0.1.5',
	},
	-- nvim tree
	{
		"nvim-tree/nvim-tree.lua"
	},
    	-- lsp
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").solargraph.setup {}
        end
    },
    {
        "tpope/vim-rails"
    },
        -- treesitter
    {
        "nvim-treesitter/nvim-treesitter"
    },
    -- snippets
})

-- keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim-tree settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- lsp settings
require'lspconfig'.solargraph.setup {
  settings = {
    solargraph = {
      diagnostics = true  -- Enables in-line diagnostics
    }
  }
}
-- treesitter settings
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,                -- false will disable the whole extension
  }
  -- additional configuration for other features like indentation, text objects, etc.
}
