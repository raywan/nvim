--------------------------------------------------------------------------------
-- @Author: Raymond Wan
-- @Created: 2024-05-19
-- @Updated: 2024-05-19
--------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- COLORS
    "EdenEast/nightfox.nvim",
    "sainnhe/everforest",

    -- "flazz/vim-colorschemes",
    -- "skywind3000/asyncrun.vim",
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-sleuth",
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        'nvim-telescope/telescope.nvim', 
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
        
            configs.setup({
                ensure_installed = {
                    "cmake", "make", "ninja",
                    "asm", "c", "cpp", "rust",
                    "javascript", "html", "css", "json",
                    "glsl", "hlsl",
                    "lua", "vim", "vimdoc" 
                },
                sync_install = false,
                highlight = { enable = true },
                -- indent = { enable = true },  
            })
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
        }
    },
})

vim.cmd("colorscheme nightfox")

vim.opt.guifont = "Berkeley Mono:h11"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.belloff = 'all'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.autoread = true
vim.opt.cursorline = true
vim.opt.wrap  = true

vim.opt.splitbelow = true
vim.opt.splitright = true


-- set tabstop=4
-- set shiftwidth=4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true 
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildmenu = true

local tele_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', tele_builtin.find_files, {})
vim.keymap.set('n', '<leader>g', tele_builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', tele_builtin.buffers, {})
vim.keymap.set('n', '<leader>h', tele_builtin.help_tags, {})

vim.keymap.set('n', '<leader>h', '<cmd>sp<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>vs<CR>')
vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>bprev<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>bnext<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<CR>')
vim.keymap.set('n', '<leader><tab>', '<C-^>')


if vim.g.neovide then
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_cursor_animation_length = 0.10
    vim.g.neovide_cursor_trail_size = 0.5
end