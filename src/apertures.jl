"""
    RadialAperture

Represents three sets of lengths relevant for building a telescope mask for a radially symmetric
design:
  * `ota`: the inner diameter of the optical tube.
  * `objective`: the size of the entrance pupil.
  * `obstruction`: the size of the central obstruction.

All units are in millimeters.
"""
struct RadialAperture
    ota::Float64
    objective::Float64
    obstruction::Float64
    function RadialAperture(ota, objective, obstruction = false)
        return new(abs(ota), abs(objective), abs(obstruction))
    end
end

"""
    GSO_RC8_APERTURE

The aperture of a GSO 8" Ritchey–Chrétien telescope, which has an OTA inner diameter of 230 mm, a
mirror size of 203 mm, and a secondary central obstruction of 94 mm.
"""
const GSO_RC8_APERTURE = RadialAperture(230, 203, 94)
