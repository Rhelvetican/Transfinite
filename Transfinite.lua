if not Transfinite then
	Transfinite = {}
	Transfinite.path = SMODS.current_mod.path

	---@param path string
	---@return function
	Transfinite.load = function(path)
		local loaded = SMODS.load_file(Transfinite.path .. path)
		if not loaded then
			error("Unable to load" .. path)
		end
		return loaded
	end
end
