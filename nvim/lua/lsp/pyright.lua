vim.lsp.config['pyright'] = {
    -- Command and arguments to start the server.
    cmd = { 'pyright-langserver', '--stdio' },
    -- Filetypes to automatically attach to.
    filetypes = { 'python' },
}
