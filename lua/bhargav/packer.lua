-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- telescope.lua (for finding files)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- rose-pine.lua (colorscheme)
    use {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")

        end
    }

    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    use {'datwaft/bubbly.nvim', config = function()
        -- Here you can add the configuration for the plugin
        vim.g.bubbly_palette = {
            background = "#34343c",
            foreground = "#c5cdd9",
            black = "#3e4249",
            red = "#ec7279",
            green = "#a0c980",
            yellow = "#deb974",
            blue = "#6cb6eb",
            purple = "#d38aea",
            cyan = "#5dbbc1",
            white = "#c5cdd9",
            lightgrey = "#57595e",
            darkgrey = "#404247",
        }
        vim.g.bubbly_statusline = {
            'mode',

            'truncate',

            'path',
            'branch',
            'signify',
            'gitsigns',
            'coc',

            'divisor',

            'filetype',
            'progress',
        }
    end}

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground', {run = ':TSUpdate'})
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('VonHeikemen/lsp-zero.nvim')
    use('neovim/nvim-lspconfig')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('saadparwaiz1/cmp_luasnip')
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    -- for debugging purpose
    use("mfussenegger/nvim-dap")
	use("nvim-neotest/nvim-nio")
    use("rcarriga/nvim-dap-ui")
    use("mfussenegger/nvim-dap-python")
    use("theHamsta/nvim-dap-virtual-text")
    -- showing tabs and git status
    use ('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
    use ('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
    use ('romgrk/barbar.nvim')
end)
