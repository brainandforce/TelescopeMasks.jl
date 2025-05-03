"""
    FNumber

A singleton used to construct focal ratios using expressions of the form `ƒ/N`.
"""
struct FNumber
end

const ƒ = FNumber()

struct FocalRatio{T<:Real}
    value::T
end

Base.show(io::IO, f::FocalRatio) = print(io, 'ƒ', '/', f.value)

Base.:/(::FNumber, x::T) where T = FocalRatio{T}(x)
