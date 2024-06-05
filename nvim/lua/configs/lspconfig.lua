-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig.util"

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "tailwindcss", "eslint" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

-- python
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { "*", ".*" } do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return exepath "python3" or exepath "python" or "python"
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
}

lspconfig.prismals.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- hello-lsp
-- local client = vim.lsp.start_client {
--   name = "hello-lsp",
--   cmd = { "/Users/abinashpanda/Projects/hello-lsp/main" },
--   on_attach = on_attach,
-- }
--
-- if not client then
--   vim.notify "error starting client"
--   return
-- end
--
-- vim.api.nvim_create_autocmd("Filetype", {
--   pattern = "markdown",
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })
