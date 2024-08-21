local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "typescript-language-server",
                "eslint-lsp",
                "prettier",
                "html-lsp",
                "css-lsp",
                "tailwindcss-language-server"

            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        'saecki/crates.nvim',
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "plugins.configs.cmp"
            table.insert(M.sources, { name = "crates" })
            return M
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { 
        "David-Kunz/gen.nvim",
        lazy = false,
        config = function ()
            require "custom.configs.gen"
        end
    }
}
return plugins
