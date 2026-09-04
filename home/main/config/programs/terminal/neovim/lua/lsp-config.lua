-- diagnostic
vim.diagnostic.config({
        virtual_text = {
                prefix = "●",
                source = "if_many",
                format = function(diag)
                        return string.format("%s: %s", diag.source, diag.message)
                end,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
})

vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Configure LSP keymaps on attach",
        callback = function(event)
                local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", vim.lsp.buf.definition, "Goto Definition")
                map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                map("gr", vim.lsp.buf.references, "Goto References")
                map("gI", vim.lsp.buf.implementation, "Goto Implementation")
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>rn", vim.lsp.buf.rename, "Rename")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
                        map("<leader>th", function()
                                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
                                vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
                        end, "Toggle Inlay Hints")
                end
        end,
})
