local utils = {}

-- "borrowed" from JenLib.
utils.can_use = function()
	return not (
		((G.play and #G.play.cards > 0) or G.CONTROLLER.locked or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))
		and G.STATE ~= G.STATES.HAND_PLAYED
		and G.STATE ~= G.STATES.DRAW_TO_HAND
		and G.STATE ~= G.STATES.PLAY_TAROT
	)
end

utils.get_hand = function(hand)
	return G.Game.hands[hand]
end

utils.set_hand = function(hand, value)
	G.Game.hands[hand] = lenient_bignum(value)
end

Transfinite.utils = utils
