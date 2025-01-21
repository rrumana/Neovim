function SetColor(color)
  color = color or "darkplus"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end


return {
  {
    "lunarvim/darkplus.nvim",
    name = "darkplus",
    config = function()
      vim.cmd("colorscheme darkplus")

      SetColor("darkplus")
    end
  },

  -- install more color themes here
}
