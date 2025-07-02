if not Cryptid then
	error("[!!] NO CRYPTID INSTALLED?? UNFATHOMABLE. MAY GOD HAVE MERCY ON YOUR WRETCHED SOUL.")
end

-- Borrowed from Mayhem.
if not Big and Big.arrow then
	error("[!!] YOU MUST ENABLE OMEGANUM (in Talisman) TO USE TRANSFINITE.")
end

if not Transfinite then
	Transfinite = {}
	Transfinite.path = SMODS.current_mod.path

	---@param path string
	Transfinite.load = function(path)
		assert(SMODS.load_file(path))()
	end
end

local items = {
	"lib/events.lua",
	"lib/math.lua",
	"lib/utils.lua",

	"items/misc/atlas.lua",

	"items/misc/colors.lua",
	"items/misc/consumables.lua",

	"items/ordinal/planets.lua",
}

for i = 1, #items do
	Transfinite.load(items[i])
end
