-- LSP (native vim.lsp.config — no nvim-lspconfig needed)

-- Rust
vim.lsp.config['rust_analyzer'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'clippy' },
      cargo = { allFeatures = true },
      procMacro = { enable = true },
    },
  },
}

-- C/C++
vim.lsp.config['clangd'] = {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', '.clangd', '.clang-tidy', '.git' },
}

-- Python
vim.lsp.config['basedpyright'] = {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = 'standard',
        autoImportCompletions = true,
      },
    },
  },
}

-- Lua
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.stylua.toml', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      diagnostics = { globals = { 'vim' } },
      telemetry = { enable = false },
    },
  },
}

-- JSON
vim.lsp.config['jsonls'] = {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  settings = {
    json = { validate = { enable = true } },
  },
}

-- YAML
vim.lsp.config['yamlls'] = {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose' },
  root_markers = { '.git' },
  settings = {
    yaml = {
      schemaStore = { enable = true },
      validate = true,
      format = { enable = false }, -- conform handles formatting
    },
  },
}

-- Markdown
vim.lsp.config['marksman'] = {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
  root_markers = { '.marksman.toml', '.git' },
}

-- Enable all
vim.lsp.enable({
  'rust_analyzer',
  'clangd',
  'basedpyright',
  'lua_ls',
  'jsonls',
  'yamlls',
  'marksman',
})

-- On attach: extra keymaps beyond the 0.12 defaults
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = 'LSP: ' .. desc })
    end

    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')

    -- Inlay hints toggle
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/inlayHint') then
      map('n', '<leader>lh', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
          { bufnr = ev.buf }
        )
      end, 'Toggle inlay hints')
    end
  end,
})

-- Diagnostic config
local sev = vim.diagnostic.severity
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = { border = 'rounded', source = true },
  signs = {
    text = {
      [sev.ERROR] = '●',
      [sev.WARN] = '●',
      [sev.INFO] = '●',
      [sev.HINT] = '○',
    },
  },
})
