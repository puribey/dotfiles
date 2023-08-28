function ApplyColorScheme(color)
  color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)
end

ApplyColorScheme()
