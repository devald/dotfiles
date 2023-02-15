vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use({'wbthomason/packer.nvim'})
  -- colorscheme
  use({'eddyekofo94/gruvbox-flat.nvim'})
  use({'sainnhe/edge'})
  use({'sainnhe/everforest'})
  use({'sainnhe/gruvbox-material'})
  use({'sainnhe/sonokai'})
  use({'shaunsingh/nord.nvim'})
  use({'dracula/vim', as = 'dracula'})

  use({'christoomey/vim-tmux-navigator'})
  use({'junegunn/fzf'})
  use({'junegunn/fzf.vim'})
  use({'mg979/vim-visual-multi'})
  use({'tpope/vim-eunuch'})
  use({'tpope/vim-fugitive'})
  use({'tpope/vim-unimpaired'})

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use({'nvim-lualine/lualine.nvim'})
  use({'lewis6991/gitsigns.nvim'})
  use({'numToStr/Comment.nvim'})
  use({'nvim-tree/nvim-web-devicons'})

  use({
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      require('mini.indentscope').setup({})
      require('mini.pairs').setup({})
      require('mini.surround').setup({})
      require('mini.trailspace').setup({})
    end
  })

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  })
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
