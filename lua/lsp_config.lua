-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lsp = require('lspconfig')
lsp.pyright.setup{
    on_attach=on_attach
}

--[[ --- ]]
--[[ -- Diagnostics ]]
-- [[ --- ]]

-- local sign = function(opts)
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = ''
--   })
-- end
--
-- sign({name = 'DiagnosticSignError', text = '✘'})
-- sign({name = 'DiagnosticSignWarn', text = '▲'})
-- sign({name = 'DiagnosticSignHint', text = '⚑'})
-- sign({name = 'DiagnosticSignInfo', text = ''})
--
-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   float = {
--     border = 'rounded',
--     source = 'always',
--     header = '',
--     prefix = '',
--   },
-- })
--
-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {border = 'rounded'}
-- )
--
-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--   vim.lsp.handlers.signature_help,
--   {border = 'rounded'}
-- )
--
-- ---
-- -- LSP config
-- ---
--
-- -- require('mason').setup({})
-- -- require('mason-lspconfig').setup({})
--
-- -- local lspconfig = require('lspconfig')
-- -- local lsp_defaults = lspconfig.util.default_config
-- --
-- -- lsp_defaults.capabilities = vim.tbl_deep_extend(
-- --   'force',
-- --   lsp_defaults.capabilities,
-- --   require('cmp_nvim_lsp').default_capabilities()
-- -- )
--
--
-- ---
-- -- LSP servers
-- ---
--
-- -- lspconfig.tsserver.setup({})
-- -- lspconfig.html.setup({})
-- -- lspconfig.cssls.setup({})
-- -- lspconfig.sumneko_lua.setup({})
--
--
-- ---
-- -- Autocomplete
-- ---
-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
--
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- local cmp = require('cmp')
-- local luasnip = require('luasnip')
--
-- local select_opts = {behavior = cmp.SelectBehavior.Select}
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end
--   },
--   sources = {
--     {name = 'path'},
--     {name = 'nvim_lsp', keyword_length = 3},
--     {name = 'buffer', keyword_length = 4},
--     {name = 'luasnip', keyword_length = 2},
--   },
--   window = {
--     documentation = cmp.config.window.bordered()
--   },
--   formatting = {
--     fields = {'menu', 'abbr', 'kind'},
--     format = function(entry, item)
--       local menu_icon = {
--         nvim_lsp = 'λ',
--         luasnip = '⋗',
--         buffer = 'Ω',
--         path = '🖫',
--       }
--
--       item.menu = menu_icon[entry.source.name]
--       return item
--     end,
--   },
--   mapping = {
--     ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
--     ['<Down>'] = cmp.mapping.select_next_item(select_opts),
--
--     ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
--     ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
--
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--     ['<C-d>'] = cmp.mapping(function(fallback)
--       if luasnip.jumpable(1) then
--         luasnip.jump(1)
--       else
--         fallback()
--       end
--     end, {'i', 's'}),
--
--     ['<C-b>'] = cmp.mapping(function(fallback)
--       if luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, {'i', 's'}),
--
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       local col = vim.fn.col('.') - 1
--
--       if cmp.visible() then
--         cmp.select_next_item(select_opts)
--       elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         fallback()
--       else
--         cmp.complete()
--       end
--     end, {'i', 's'}),
--
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item(select_opts)
--       else
--         fallback()
--       end
--     end, {'i', 's'}),
--   },
-- })
