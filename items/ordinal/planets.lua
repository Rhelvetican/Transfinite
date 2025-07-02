---@class Planet
---@field key string
---@field name string
---@field hand string

---@type table<number, Planet>
local planets = {
	{
		name = "Pluto",
		key = "pluto",
		hand = "High Card",
	},
	{
		name = "Mercury",
		key = "mercury",
		hand = "Pair",
	},
	{
		name = "Uranus",
		key = "uranus",
		hand = "Two Pair",
	},
	{
		name = "Venus",
		key = "venus",
		hand = "Three of a Kind",
	},
	{
		name = "Saturn",
		key = "saturn",
		hand = "Straight",
	},
	{
		name = "Jupiter",
		key = "jupiter",
		hand = "Flush",
	},
	{
		name = "Earth",
		key = "earth",
		hand = "Full House",
	},
	{
		name = "Mars",
		key = "mars",
		hand = "Four of a Kind",
	},
	{
		name = "Neptune",
		key = "neptune",
		hand = "Straight Flush",
	},
	{
		name = "Planet X",
		key = "planet_x",
		hand = "Five of a Kind",
	},
	{
		name = "Ceres",
		key = "ceres",
		hand = "Flush House",
	},
	{
		name = "Eris",
		key = "eris",
		hand = "Flush Five",
	},
}

for pos, value in ipairs(planets) do
	print(pos)
	SMODS.Consumable({
		key = "ord_" .. value.key,
		set = "tfnt_o_planet",
		atlas = "o_planet",

		cost = 1000,

		loc_vars = function(_, _)
			return {
				vars = {
					colours = {
						Transfinite.colors.gradients.ordinal,
					},
				},
			}
		end,

		loc_txt = {
			name = "{C:1}Ordinal{} " .. value.name,

			text = {
				"{B:1,s:1.5,E:2}^3{} {C:attention}"
					.. value.hand
					.. "{} {C:chips}Chips{}, {C:chips}Level Chips{}, {C:mult}Mult{} and {C:mult}Level Mult{}.",
				"Then {B:1,s:1.5,E:2}^^3{} {C:attention}" .. value.hand .. "{} level.",
			},
		},

		pos = { x = 0, y = pos },
		soul_pos = { x = 1, y = pos },

		can_use = function(_, _)
			return Transfinite.utils.can_use()
		end,

		use = function(_, card, _, _)
			local hand = value.hand
			local hand_data = Transfinite.utils.get_hand(hand)

			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					card:juice_up(0.8, 0.5)
					return true
				end,
			}))

			hand_data.l_chips = Transfinite.math.pow(hand_data.l_chips, 3)
			hand_data.l_mult = Transfinite.math.pow(hand_data.l_mult, 3)

			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					card:juice_up(0.8, 0.5)
					return true
				end,
			}))

			hand_data.chips = Transfinite.math.pow(hand_data.chips, 3)
			hand_data.mult = Transfinite.math.pow(hand_data.mult, 3)

			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					card:juice_up(0.8, 0.5)
					return true
				end,
			}))

			hand_data.level = Transfinite.math.tetrate(hand_data.level, 3)

			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					card:juice_up(0.8, 0.5)
					return true
				end,
			}))
		end,
	})
end
