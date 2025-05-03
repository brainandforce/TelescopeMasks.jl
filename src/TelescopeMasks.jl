module TelescopeMasks

using CliffordNumbers
using XML

import CliffordNumbers.Metrics.CGA2D

#=
include("fratio.jl")
export ƒ
=#
include("patterns.jl")
export AbstractMaskPattern, BahtinovPattern, MultiBahtinovPattern, CareyPattern
include("apertures.jl")
export RadialAperture
include("masks.jl")
export TelescopeMask, BahtinovMask
include("export.jl")

end
