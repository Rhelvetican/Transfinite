Transfinite.config.planets = {
    planet = { stats = 3, levels = 6 },
    blackhole = { stats = 6, levels = 9 },
}

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
        name = " X",
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

for pos, value in pairs(planets) do
    SMODS.Consumable({
        key = "ord_" .. value.key,
        set = "tfnt_ordinalconsumable",
        atlas = "o_planet",

        cost = 225,

        loc_vars = function(_, _)
            return {
                vars = {
                    Transfinite.config.planets.planet.stats,
                    Transfinite.config.planets.planet.levels,
                },
            }
        end,

        loc_txt = {
            name = "Ordinal " .. value.name,

            text = {
                "{X:tfnt_gradient_ordinal1,E:2}^#1#{} {C:attention}" .. value.hand .. "{} {C:chips}Level Chips{} and {C:mult}Level Mult{}.",
                "Then {X:tfnt_gradient_ordinal1,E:2}^^#2#{} {C:attention}" .. value.hand .. "{} level.",
            },
        },

        pos = { x = 0, y = 0 },
        soul_pos = { x = 1, y = pos - 1 },

        can_use = function(_, _) return Transfinite.utils.can_use() end,

        use = function(_, card, _, _)
            local hand = value.hand
            local hand_data = Transfinite.utils.get_hand(hand)

            Transfinite.utils.juice_up_card(card)
            hand_data.level = Transfinite.math.tetrate(hand_data.level, Transfinite.config.planets.planet.levels)
            Transfinite.utils.juice_up_card(card)
            hand_data.l_chips = Transfinite.math.pow(hand_data.l_chips, Transfinite.config.planets.planet.stats)
            hand_data.l_mult = Transfinite.math.pow(hand_data.l_mult, Transfinite.config.planets.planet.stats)
            Transfinite.utils.juice_up_card(card)
            hand_data.chips = hand_data.chips:add(hand_data.level:mul(hand_data.l_chips))
            hand_data.mult = hand_data.mult:add(hand_data.level:mul(hand_data.l_mult))
            Transfinite.utils.juice_up_card(card)
            Transfinite.utils.set_hand(hand, hand_data)
        end,
    })
end

SMODS.Consumable({
    key = "ord_blackhole",
    set = "tfnt_ordinalconsumable",
    atlas = "o_blackhole",

    cost = 1750,

    loc_vars = function(_, _)
        return {
            vars = {
                Transfinite.config.planets.blackhole.stats,
                Transfinite.config.planets.blackhole.levels,
            },
        }
    end,

    loc_txt = {
        name = "{s:2}TON 618{}",

        text = {
            "{X:tfnt_gradient_ordinal,E:2}^^#1#{} {C:attention,E:2}all hands'{} {C:chips} {C:chips}Level Chips{} and {C:mult}Level Mult{}.",
            "Then {X:tfnt_gradient_ordinal,E:2}^^^#2#{} {C:attention,E:2}all hands'{} levels.",
        },
    },

    pos = { x = 0, y = 0 },
    tsoul_pos = { x = 0, y = 1 },

    can_use = function(_, _) return Transfinite.utils.can_use() end,

    use = function(_, card, _, _)
        for hand, _ in pairs(G.GAME.hands) do
            local hand_data = Transfinite.utils.get_hand(hand)
            Transfinite.utils.juice_up_card(card)
            hand_data.level = Transfinite.math.arrows(hand_data.level, Transfinite.config.planets.blackhole.levels, 3)
            Transfinite.utils.juice_up_card(card)
            hand_data.l_chips = Transfinite.math.tetrate(hand_data.l_chips, Transfinite.config.planets.blackhole.stats)
            hand_data.l_mult = Transfinite.math.tetrate(hand_data.l_mult, Transfinite.config.planets.blackhole.stats)
            Transfinite.utils.juice_up_card(card)
            hand_data.chips = hand_data.chips:add(hand_data.level:mul(hand_data.l_chips))
            hand_data.mult = hand_data.mult:add(hand_data.level:mul(hand_data.l_mult))
            Transfinite.utils.juice_up_card(card)
        end
    end,
})
