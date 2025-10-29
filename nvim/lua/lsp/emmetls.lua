-- configure emmet language server
vim.lsp.config["emmetls"] = {
    cmd = { "emmet-language-server", "--stdio"},
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" }
}
