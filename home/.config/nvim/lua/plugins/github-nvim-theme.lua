local M = {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function ()
        require("github-theme").setup({
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold"
                }
            }
        })
        vim.cmd.colorscheme("github_dark_default")
    end
}

return { M }
