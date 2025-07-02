local events = {}

events.create = function(fc, de, t, tr, bl, ba)
	G.E_MANAGER:add_event(Event({
		timer = t,
		trigger = tr,
		delay = de,
		blockable = bl,
		blocking = ba,
		func = fc,
	}))
end

Transfinite.events = events
