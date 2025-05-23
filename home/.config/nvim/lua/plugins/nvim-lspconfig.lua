local M = {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
        servers = {
            lua_ls = { "luals" },
            clangd = { "clangd" },
            cmake = { "cmake_language_server" },
            bashls = { "bashls" },
        }
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            if server == opts.servers.clangd then
                cmd = {
                    "-xc++"
                }
            end
            lspconfig[server].setup(config)
        end
        lspconfig.omnisharp.setup {
            cmd = {
                "dotnet",
                os.getenv("HOME") .. "/csharp/omnisharp/OmniSharp.dll"
            }
        }
    end
}

return { M }
