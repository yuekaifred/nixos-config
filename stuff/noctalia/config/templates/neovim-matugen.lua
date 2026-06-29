local colors = {
	-- Core Backgrounds (Deepest Darks)
	crust = "{{colors.surface_container_lowest.default.hex}}",
	mantle = "{{colors.surface_container_low.default.hex}}",
	base = "{{colors.surface.default.hex}}",

	-- UI Elements & Overlays
	surface0 = "{{colors.surface_container.default.hex}}",
	surface1 = "{{colors.surface_container_high.default.hex}}",
	surface2 = "{{colors.surface_container_highest.default.hex}}",
	overlay0 = "{{colors.on_surface_variant.default.hex}}",
	overlay1 = "{{colors.outline.default.hex}}",
	overlay2 = "{{colors.on_surface_variant.default.hex}}",

	-- Text & Foreground
	subtext0 = "{{colors.on_surface_variant.default.hex}}",
	subtext1 = "{{colors.on_surface.default.hex}}",
	text = "{{colors.on_surface.default.hex}}",

	-- Syntax Highlights
	rosewater = "{{colors.on_primary_container.default.hex}}",
	flamingo = "{{colors.on_tertiary_container.default.hex}}",
	pink = "{{colors.on_tertiary_container.default.hex}}",
	mauve = "{{colors.tertiary.default.hex}}",
	red = "{{colors.error.default.hex}}",
	maroon = "{{colors.on_error_container.default.hex}}",
	peach = "{{colors.secondary.default.hex}}",
	yellow = "{{colors.on_secondary_container.default.hex}}",
	green = "{{colors.primary.default.hex}}",
	teal = "{{colors.on_primary_container.default.hex}}",
	sky = "{{colors.secondary.default.hex}}",
	sapphire = "{{colors.on_secondary_container.default.hex}}",
	blue = "{{colors.primary.default.hex}}",
	lavender = "{{colors.on_tertiary_container.default.hex}}",
}

local M = {}
function M.setup()
<* if {{ mode | replace: "light", "" }} *>
	require("catppuccin").setup({
		flavor = "mocha",
		color_overrides = {
			mocha = colors,
		},
	})
	vim.cmd.colorscheme("catppuccin-mocha")
<* else *>
	require("catppuccin").setup({
		flavor = "latte",
		color_overrides = {
			latte = colors,
		},
	})
	vim.cmd.colorscheme("catppuccin-latte")
<* endif *>
end
return M
