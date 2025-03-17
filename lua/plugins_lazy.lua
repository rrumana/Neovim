return {

    {
        "lunarvim/darkplus.nvim",
        name = "darkplus",
    },

    -- install more color themes here 

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "github/copilot.vim",
    "eandrju/cellular-automaton.nvim",
    "gpanders/editorconfig.nvim",
    "lewis6991/gitsigns.nvim",
    "laytan/cloak.nvim",
    "tpope/vim-fugitive",

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { 
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim"
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
    },

    {
        "nvim-tree/nvim-web-devicons",
        opts = {}
    },

    "mbbill/undotree",
}
