local formatter = require('formatter.filetypes')
require('formatter').setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    ['*'] = { formatter.any.remove_trailing_whitespace },
    c = { formatter.c.clangformat },
    cpp = { formatter.cpp.clangformat },
    css = { formatter.css.prettierd },
    go = { formatter.go.gofmt },
    html = { formatter.html.prettierd },
    javascript = { formatter.javascript.prettierd },
    javascriptreact = { formatter.javascriptreact.prettierd },
    json = { formatter.json.prettierd },
    lua = { formatter.lua.stylua },
    markdown = { formatter.markdown.prettierd },
    sh = { formatter.sh.shfmt },
    toml = { formatter.toml.taplo },
    typescript = { formatter.typescript.prettierd },
    typescriptreact = { formatter.typescriptreact.prettierd },
    yaml = { formatter.yaml.yamlfmt },
  },
})
