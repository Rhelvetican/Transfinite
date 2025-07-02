local math = {}

math.mul = function(a, b)
    local biga, bigb = to_big(a), to_big(b)
    return biga:mul(bigb)
end

math.pow = function(a, b)
    local biga, bigb = to_big(a), to_big(b)
    return biga:pow(bigb)
end

math.tetrate = function(a, b)
    local biga, bigb = to_big(a), to_big(b)
    return biga:tetrate(bigb)
end

math.arrows = function(a, b, arrows)
    local biga, bigb = to_big(a), to_big(b)
    return biga:arrow(arrows, bigb)
end

Transfinite.math = math
