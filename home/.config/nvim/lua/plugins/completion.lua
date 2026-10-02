return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    formatters_by_ft = {
      bash = { "shfmt" },
      bib = { "bibtex-tidy" },
      html = { "htmlbeautifier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "trim_whitespace" , "prettier" },
      python = { "isort", "black" },
      sty = { "latexindent" },
      tex = { "latexindent" },
      yaml = { "yamlfmt" },
    },
    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype ~= "markdown" then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters = {
      latexindent = {
        command = "latexindent",
        args = { "-s", "-g", "/dev/null", "$FILENAME" },
        stdin = false,
      },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Conform formatting",
    },
  },
}
