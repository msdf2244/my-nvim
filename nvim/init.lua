require('settings')
require('keybindings')
require('plugins.mini')
require('plugins.yazi')
require('plugins.blink')

require('catppuccin').setup { flavour = "mocha" }
vim.cmd.colorscheme "catppuccin"

require('lsp.luals')
require('lsp.pyright')
require('lsp.nil')
require('lsp.rust-analyzer')

vim.lsp.enable('luals')
vim.lsp.enable('nil')
vim.lsp.enable('pyright')
vim.lsp.enable('rust-analyzer')

-- enable tree sitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end
})

