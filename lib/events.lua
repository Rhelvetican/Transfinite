local events = {}

---Create an Event
---@param event Event
events.create = function(event) G.E_MANAGER:add_event(Event(event)) end

Transfinite.events = events
