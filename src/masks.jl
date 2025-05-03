"""
    TelescopeMask{P<:AbstractMaskPattern,A<:RadialAperture}

A complete definition of a telescope mask, including the mask pattern and the relevant dimensions
for the target telescope.
"""
struct TelescopeMask{P<:AbstractMaskPattern,A<:RadialAperture}
    mask::P
    aperture::A
end

const BahtinovMask{A} = TelescopeMask{BahtinovPattern,A}
