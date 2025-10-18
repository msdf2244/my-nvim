require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.completion').setup()
require('mini.snippets').setup()
require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.comment').setup()
require('mini.pick').setup()
require('mini.extra').setup()
require('yazi').setup()
require('catppuccin').setup { flavour = "mocha" }
require('mini.icons').setup()
MiniIcons.tweak_lsp_kind()

vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.signcolumn = "yes:1"
vim.g.mapleader = " "
vim.g.localmapleader = ","

vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", {})
vim.keymap.set("n", "<leader>ws", ":split<CR>", {})
vim.keymap.set("n", "<leader>wo", "<C-w>o", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", {})
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", {})
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", {})
vim.keymap.set("n", "<leader>bD", ":bdelete!<CR>", {})
vim.keymap.set("n", "<leader>bb", ":Pick buffers<CR>", {})

vim.keymap.set("n", "<leader>y", ":Yazi<CR>", {})

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

vim.lsp.config['nil'] = {
    cmd = { 'nil' },
    filetypes = { 'nix' },
    root_markers = { '.git' },
}

vim.lsp.config['pyright'] = {
    -- Command and arguments to start the server.
    cmd = { 'pyright-langserver', '--stdio' },
    -- Filetypes to automatically attach to.
    filetypes = { 'python' },
}

vim.lsp.config['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' }
}

vim.lsp.config['nimlangserver'] = {
    cmd = { 'nimlangserver' },
    filetypes = { 'nim' }
}

vim.lsp.enable('luals')
vim.lsp.enable('nil')
vim.lsp.enable('pyright')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('nimlangserver')

-- enable tree sitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})

vim.cmd.colorscheme "catppuccin"
