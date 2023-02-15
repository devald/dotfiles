require('lualine').setup({
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'filename'},
    lualine_y = {},
    lualine_z = {}
  },

  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'filename'},
    lualine_y = {},
    lualine_z = {}
  }
})
