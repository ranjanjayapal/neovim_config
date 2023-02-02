-- vim.cmd[[colorscheme onedark]]
-- github theme config
require("github-theme").setup({
  theme_style = "dark",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
  dark_sidebar = false,

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
    }
  end
})
