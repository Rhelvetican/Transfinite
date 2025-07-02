local gradients = {}
local colors = {}

gradients.ordinal = SMODS.Gradient({
	key = "tfnt_gradient_ordinal",
	colours = {
		HEX("D7EBEB"),
		HEX("F4AFE9"),
		HEX("9D7EF3"),
		HEX("F4AFE9"),
	},
})

colors.gradients = gradients
Transfinite.colors = colors
