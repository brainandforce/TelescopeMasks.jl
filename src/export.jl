function generate_svg_template(a::RadialAperture, padding::Real = false)
    svg_size = a.ota + 2 * padding
    outer_radius = a.ota / 2
    inner_radius = a.obstruction / 2
    svg_center = outer_radius + padding
    unit = " mm"
    # Generate the circular portion of the mask
    return XML.Document(
        # SVG header
        XML.DTD(
            "svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" " *
            "\"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\""
        ),
        XML.Element(
            "svg", 
            XML.Element(
                "circle",
                cx = 0,
                cy = 0,
                r = outer_radius,
                fill = "black"
            ),
            XML.Element(
                "circle",
                cx = 0,
                cy = 0,
                r = inner_radius,
                fill = "none"
            ),
            version = "1.1",
            width = string(svg_size, unit),
            height = string(svg_size, unit),
            transform = string("translate(", svg_center, ", ", svg_center, ")"),
            xmlns = "http://www.w3.org/2000/svg"
        ),
    )
end

"""
    export_svg(io::IO, m::TelescopeMask)
    export_svg(file, m::TelescopeMask)

Exports the given mask as an SVG file.
"""
export_svg(file, m::TelescopeMask) = open(io -> export_svg(io, m), file)

"""
    export_svg(file, m::BahtinovMask{A}; rounded = true)


"""
function export_svg(io::IO, m::BahtinovMask{RadialAperture}; rounded = true, padding = false)
    # Generate the circular portion of the mask
    svg = generate_svg_template(m.aperture, padding)
    XML.write(io, svg)
end
