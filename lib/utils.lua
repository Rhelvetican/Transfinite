local utils = {}

---@generic T
---@param tbl table<any, T>
---@param item T
---@return boolean
utils.contains = function(tbl, item)
    for _, value in pairs(tbl) do
        if value == item then return true end
    end

    return false
end

-- "borrowed" from JenLib.
utils.can_use = function()
    return not (
        ((G.play and #G.play.cards > 0) or G.CONTROLLER.locked or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
        and G.STATE ~= G.STATES.HAND_PLAYED
        and G.STATE ~= G.STATES.DRAW_TO_HAND
        and G.STATE ~= G.STATES.PLAY_TAROT
    )
end

utils.get_hand = function(hand) return G.GAME.hands[hand] end

utils.set_hand = function(hand, value) G.GAME.hands[hand] = to_big(value) end

---@param card any
---@param scale number?
---@param rot number?
utils.juice_up_card = function(card, scale, rot)
    if scale == nil then scale = 0.8 end
    if rot == nil then scale = 0.5 end

    Transfinite.events.create(Event({
        trigger = "after",
        delay = 0.2,
        func = function()
            card:juice_up(scale, rot)
            return true
        end,
    }))
end

Transfinite.utils = utils
