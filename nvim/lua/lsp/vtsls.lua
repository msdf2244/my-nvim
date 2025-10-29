vim.lsp.config['vtsls'] = {
    -- Command and arguments to start the server.
    cmd = { 'vtsls', '--stdio' },
    -- Filetypes to automatically attach to.
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
}
