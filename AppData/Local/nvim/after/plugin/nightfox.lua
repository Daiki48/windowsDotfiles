local status, nightfox = pcall(require, 'nightfox')
if (not status) then return end

nightfox.setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    styles = {
      comments = "NONE",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {},
  },
  palettes = {},
  specs = {},
  groups = {},
})

vim.cmd("colorscheme nightfox")
