local math = {}

math.mul = function(a, b)
	local biga, bigb = lenient_bignum(a), lenient_bignum(b)
	return biga:mul(bigb)
end

math.pow = function(a, b)
	local biga, bigb = lenient_bignum(a), lenient_bignum(b)
	return biga:pow(bigb)
end

math.tetrate = function(a, b)
	local biga, bigb = lenient_bignum(a), lenient_bignum(b)
	return biga:tetrate(bigb)
end

math.arrows = function(a, b, arrows)
	local biga, bigb = lenient_bignum(a), lenient_bignum(b)
	return biga:arrows(arrows, bigb)
end

Transfinite.math = math
