function round_sum(x::Float64, y::Float64; digits::Int64)

    return round( round(x, digits=digits) + round(y, digits=digits),
    digits=digits)
    

end
round_sum(3.01244124, 0.2348728347; digits = 3)

function round_mul(x::Float64, y::Float64; digits::Int64)

    return round( round(x, digits=digits) * round(y, digits=digits), digts=digits)

end

function trunc_sum(x::Float64, y::Float64; digits::Int64)
   
    return trunc( trunc(x, digits=digits) + trunc(y, digits=digits), digts=digits)

end

function trunc_mul(x::Float64, y::Float64; digits::Int64)

    return trunc( trunc(x, digits=digits) * trunc(y, digits=digits), digts=digits)

end
