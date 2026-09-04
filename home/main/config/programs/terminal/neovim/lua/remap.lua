-- (.config/nvim/lua/neoconf/remap.lua)
-- leader = space
-- C = ctrl
-- clear highlights when typing esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- exit terminal mode (or ctrl C)
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- disable arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- ctrl hjkl for moving between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- oil
vim.keymap.set("n", "<leader>n", "<cmd>Oil<CR>", { desc = "Launch oil buffer" })
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
-- spell checker from fr to en
vim.keymap.set("n", "<leader>sf", function()
        if vim.o.spelllang == "fr" then
                vim.o.spelllang = "en"
        else
                vim.o.spelllang = "fr"
        end
        vim.o.spell = true
        print("Spelllang: " .. vim.o.spelllang)
end, { desc = "Toggle spelllang FR/EN" })
-- toggle correction
vim.keymap.set("n", "<leader>sg", function()
        vim.wo.spell = not vim.wo.spell
        vim.notify("Spell: " .. (vim.wo.spell and "ON" or "OFF"), vim.log.levels.INFO)
end, { desc = "Toggle spell check" })

vim.api.nvim_create_user_command("OctaveRun", function()
        vim.cmd("write")
        vim.cmd('!octave -qf "%:p"')
end, {})
vim.keymap.set("n", "<leader>ro", "<cmd>OctaveRun<CR>", { desc = "Run current Octave/Matlab file" })

-- set vimtex main to current file
local function vimtex_set_main()
        vim.b.vimtex_main = vim.fn.expand("%:p")
        vim.b.vimtex = nil
        vim.fn["vimtex#init"]()
        print("VimTeX main → " .. vim.b.vimtex_main)
end

vim.keymap.set("n", "<leader>lm", vimtex_set_main, { desc = "VimTeX: set main to current file" })
