--
-- Packer install & config
--
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
  'BufWritePost', { 
    command = 'source <afile> | PackerSync', 
    group = packer_group, 
    pattern = 'init.lua' 
  })

--
-- Install packages
--
require('packer').startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  
  use 'joshdick/onedark.vim'
  use 'christoomey/vim-tmux-navigator'
  use { 
    'nvim-telescope/telescope.nvim', 
    requires = { 'nvim-lua/plenary.nvim' } 
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }
end)

--
-- Basic options
--
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.cursorline = false                       -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 250                        -- faster completion (4000ms default)
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.shortmess:append "c"
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.cmd "colorscheme onedark"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('telescope').setup { }

vim.cmd "nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>"
vim.cmd "nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>"
vim.cmd "nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>"
vim.cmd "nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
