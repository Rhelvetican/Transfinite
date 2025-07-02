if not Cryptid then
	error("[!!] NO CRYPTID INSTALLED?? UNFATHOMABLE. MAY GOD HAVE MERCY ON YOUR WRETCHED SOUL.")
end

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

local items = {
	"items/colors.lua",
	"items/consumables.lua",
}

for i = 1, #items do
	Transfinite.load(items[i])
end
