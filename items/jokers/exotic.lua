SMODS.Joker({
    key = "omega",
    pos = { x = 0, y = 0 },
    rarity = "cry_exotic",
    soul_pos = { x = 1, y = 0, extra = { x = 2, y = 0 } },
    atlas = "exojkr",

    cost = 100,

    loc_txt = {
        name = "Omega",
        text = {
            "Creates a random {X:tfnt_gradient_ordinal1,C:attention}Ordinal{} consumable",
            "at the end of the shop.",
            "{C:inactive}(Must have room.){}",
        },
    },

    calculate = function(_, card, context)
        if context.ending_shop and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            return {
                extra = {
                    message = "Ordinalized!",
                    message_card = card,
                    func = function()
                        Transfinite.events.create(Event({
                            SMODS.add_card({
                                set = "tfnt_ordinalconsumable",
                                key_append = "120291",
                            }),
                        }))

                        G.GAME.consumeable_buffer = 0
                        return true
                    end,
                },
            }
        end
    end,
})
