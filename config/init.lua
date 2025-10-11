vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.signcolumn = "yes:1"
vim.g.mapleader = " "

require('mini.statusline').setup()
require('mini.completion').setup()
require('mini.icons').setup()
require('mini.snippets').setup()
require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.comment').setup()
require('mini.pick').setup()
require('mini.extra').setup()

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {})
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", {})
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", {})
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", {})
vim.keymap.set("n", "<leader>bb", ":Pick buffers<CR>", {})
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", {})
vim.keymap.set("n", "<leader>fs", ":Pick lsp scope='document_symbol'<CR>", {})
vim.keymap.set("n", "<leader>fx", ":Pick diagnostic scope='current'<CR>", {})
vim.keymap.set("n", "<leader>fm", ":Pick marks<CR>", {})
vim.keymap.set("n", "<leader>fp", ":e " .. vim.fn.stdpath('config') .. "<CR>", {})
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>", {})
vim.keymap.set("n", "<leader>cf", ":lua vim.lsp.buf.format()<CR>", {})
vim.keymap.set("n", "<leader>cr", ":lua vim.lsp.buf.rename()<CR>", {})
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", {})
vim.keymap.set("n", "<leader>ci", ":lua vim.lsp.buf.implementation()<CR>", {})
vim.keymap.set("n", "<leader>cs", ":lua vim.lsp.buf.references()<CR>", {})
vim.keymap.set("n", "<C-k>", ":lua vim.diagnostic.open_float()<CR>", {})

-- LSP
vim.lsp.config['luals'] = {
    -- Command and arguments to start the server.
    cmd = { 'lua-language-server' },
    -- Filetypes to automatically attach to.
    filetypes = { 'lua' },
    -- Sets the "workspace" to the directory where any of these files is found.
    -- Files that share a root directory will reuse the LSP server connection.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    -- Specific settings to send to the server. The schema is server-defined.
    -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}
vim.lsp.enable('luals')

vim.lsp.config['nil'] = {
    cmd = { 'nil' },
    filetypes = { 'nix' },
    root_markers = { '.git' },
}
vim.lsp.enable('nil')

