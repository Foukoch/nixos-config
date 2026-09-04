-- .config/nvim/lua/neoconf/settings.lua
vim.g.have_nerd_font = true
-- options
-- enable line number
vim.o.number = true
-- relative line number
vim.o.relativenumber = true
-- dont show the mode
vim.o.showmode = true
-- sync clipboard
vim.schedule(function()
        vim.o.clipboard = "unnamedplus"
end)
-- enable break indent
vim.o.breakindent = true
-- indent options
vim.o.autoindent = true
-- vim.o.smartindent = true
vim.o.expandtab = true
-- save undo history
vim.o.undofile = true
-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true
-- keep signcolumn
vim.o.signcolumn = "yes"
-- config new split opening
vim.o.splitright = true
vim.o.splitbelow = true
-- whitespace char display
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- preview substitutions live with !
vim.o.inccommand = "split"
-- show line cursor
vim.o.cursorline = true
-- min lines above and below cursor
vim.o.scrolloff = 10
-- confirm save/confirm
vim.o.confirm = true
-- spell checking
-- vim.opt.spell = true
vim.opt.spelllang = "fr"
-- wrap
vim.o.wrap = true
vim.o.linebreak = true
-- indent
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- timers
vim.o.updatetime = 250
vim.o.timeoutlen = 300
