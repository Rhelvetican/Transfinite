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
    key = "fibbonacci_joker",
    loc_txt = {
        name = "Fibonacci Joker",
        text = {
            "At the {C:attention}end of round{},",
            "Gains it's previous {C:mult,E:1}+Mult{} value.",
            "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}",
            "{C:inactive}(Previously {C:mult}+#2#{} {C:inactive}Mult){}",
        },
    },
    atlas = "jkr",

    pos = { x = 1, y = 0 },
    config = {
        extra = {
            cur = 1,
            prev = 0,
        },
    },

    loc_vars = function(_, _, card) return { vars = { card.ability.extra.cur, card.ability.extra.prev } } end,
    cost = 16,
    rarity = "cry_epic",

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(_, card, context)
        if context.end_of_round and context.main_eval then
            local cur = card.ability.extra.cur
            card.ability.extra.cur = card.ability.extra.cur + card.ability.extra.prev
            card.ability.extra.prev = cur
        end

        if context.joker_main then return { mult = card.ability.extra.cur, message = "+" .. tostring(card.ability.extra.cur) } end
    end,
})
