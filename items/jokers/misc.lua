SMODS.Joker({
    key = "entropic_joker",
    loc_txt = {
        name = "Entropic Joker",
        text = {
            "{X:tfnt_gradient_ordinal1,C:white,E:2}^^#1#{} Mult.",
            "{C:inactive}From Entropy.{}",
        },
    },
    atlas = "jkr",

    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Eemult_mod = 1.02,
        },
    },

    loc_vars = function(_, _, card) return { vars = { number_format(card.ability.extra.Eemult_mod) } } end,
    cost = 2,
    rarity = 1,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(_, card, context)
        if context.joker_main then
            return SMODS.calculate_effect({
                EEmult_mod = card.ability.extra.Eemult_mod,
                message = "^^" .. tostring(card.ability.extra.Eemult_mod),
                colour = Transfinite.colors.gradients.ordinalalt,
            }, card)
        end
    end,
})

SMODS.Joker({
    key = "cryptid_joker",
    loc_txt = {
        name = "Cryptid the Joker",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult at the end of turn.",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive})",
        },
    },
    atlas = "jkr",

    pos = { x = 1, y = 0 },
    config = {
        extra = {
            xmult_gain = 0.05,
            xmult = 1.0,
        },
    },

    loc_vars = function(_, _, card) return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } } end,
    cost = 3,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(_, card, context)
        if context.end_of_round and context.main_eval then card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain end
        if context.joker_main then return { Xmult_mod = card.ability.extra.n, message = "X" .. tostring(card.ability.extra.xmult) } end
    end,
})

SMODS.Joker({
    key = "broken_crown",
    loc_txt = {
        name = "Cryptid the Joker",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult at the end of turn.",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive})",
        },
    },
    atlas = "jkr",
})
