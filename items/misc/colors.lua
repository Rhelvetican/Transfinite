local gradients = {}
local colors = {}

gradients.ordinal = SMODS.Gradient({
    key = "tfnt_gradient_ordinal",
    colours = {
        HEX("D7EBEB"),
        HEX("F4AFE9"),
        HEX("9D7EF3"),
    },
    cycle = 2,
})

gradients.ordinalalt = SMODS.Gradient({
    key = "tfnt_gradient_ordinal1",
    colours = {
        HEX("F4AFE9"),
        HEX("9D7EF3"),
        HEX("D7EBEB"),
    },
    cycle = 4,
})

gradients.ordinalalt2 = SMODS.Gradient({
    key = "tfnt_gradient_ordinal2",
    colours = {
        HEX("9D7EF3"),
        HEX("D7EBEB"),
        HEX("F4AFE9"),
    },
    cycle = 6,
})

colors.gradients = gradients
Transfinite.colors = colors
