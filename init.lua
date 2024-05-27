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
    -- BEGIN: COLORS ------------------------------------------------

    "EdenEast/nightfox.nvim",
    "sainnhe/everforest",
    "yorickpeterse/vim-paper",
    { 
        "ntk148v/komau.vim",
        config = function()
            vim.g.komau_italic = 1
            vim.g.komau_bold = 1
        end,
    },
    {
        "mcchrish/zenbones.nvim", 
        dependencies = { "rktjmp/lush.nvim" }
    },

    -- END: COLORS ---------------------------------------------------

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


vim.opt.background = "dark"
vim.cmd("colorscheme komau")

vim.opt.guifont = "Berkeley Mono:h10"

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

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.incsearch = true
vim.opt.hlsearch = true 
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wildmenu = true

vim.keymap.set('n', '<leader><F11>', '<cmd>set background=dark<CR>')
vim.keymap.set('n', '<leader><F12>', '<cmd>set background=light<CR>')

vim.keymap.set('n', '<leader>ev', '<cmd>e $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>sv', '<cmd>so $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>sp<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>vs<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>sp<CR>')
vim.keymap.set('n', '<leader>v', '<cmd>vs<CR>')
vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>[', '<cmd>bprev<CR>')
vim.keymap.set('n', '<leader>]', '<cmd>bnext<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>bdelete<CR>')
vim.keymap.set('n', '<leader><tab>', '<C-^>')

local tele_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', tele_builtin.find_files, {})
vim.keymap.set('n', '<leader>g', tele_builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', tele_builtin.buffers, {})
vim.keymap.set('n', '<leader>h', tele_builtin.help_tags, {})

vim.keymap.set('n', '<leader>\\', '<cmd>Neotree toggle<CR>')

vim.keymap.set('v', '<C-c>', '"+yi')
vim.keymap.set('v', '<C-x>', '"+c')
vim.keymap.set('v', '<C-v>', 'c<ESC>"+p')
vim.keymap.set('i', '<C-v>', '<ESC>"+pa')


if vim.g.neovide then
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_cursor_animation_length = 0.10
    vim.g.neovide_cursor_trail_size = 0.5
end
