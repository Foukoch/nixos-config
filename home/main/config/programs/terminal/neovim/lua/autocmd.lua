-- (.config/nvim/lua/neoconf/autocmd.lua)
local function run_curr_python_file()
        -- Get file name in the current buffer
        local file_name = vim.api.nvim_buf_get_name(0)

        -- Get terminal codes for running python file
        -- ("i" to enter insert before typing rest of the command)
        local py_cmd = vim.api.nvim_replace_termcodes('ipython "' .. file_name .. '"<cr>', true, false, true)

        -- Determine terminal window split and launch terminal
        local percent_of_win = 0.4
        local curr_win_height = vim.api.nvim_win_get_height(0)           -- Current window height
        local term_height = math.floor(curr_win_height * percent_of_win) -- Terminal height
        vim.cmd(":below " .. term_height .. "split | term")              -- Launch terminal (horizontal split)

        -- Press keys to run python command on current file
        vim.api.nvim_feedkeys(py_cmd, "t", false)
end

vim.keymap.set({ "n" }, "<A-r>", "", {
        desc = "Run .py file via Neovim built-in terminal",
        callback = run_curr_python_file,
})

vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "rmd" },
        callback = function()
                -- Force syntaxe markdown
                vim.bo.syntax = "markdown"
                -- Conceal normal pour markdown
                vim.wo.conceallevel = 2
                -- Désactive vimtex pour ces fichiers
                vim.b.vimtex_syntax_enabled = 0
                -- spellcheck
                vim.wo.spell = true
        end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local ok = pcall(vim.treesitter.start)
		if ok then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
-- active spell sur .tex
vim.api.nvim_create_autocmd("FileType", { pattern = "tex", callback = function() vim.wo.spell = true end })

vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank() end })
