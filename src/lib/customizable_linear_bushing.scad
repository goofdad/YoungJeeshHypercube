 /*
 * Customizable Linear Bushing - https://www.thingiverse.com/thing:2202854
 * by Dennis Hofmann - https://www.thingiverse.com/mightynozzle/about
 * created 2017-03-25
 * updated 2017-08-15
 * version v1.5
 *
 * Changelog
 * --------------
 * v1.5:
 *      - fixed graphic glitch
 * v1.4:
 *      - added chamfer option
 *
 * v1.1-1.3:
 *      - initial model with minor changes in description
 *
 * --------------
 * 
 * This work is licensed under the Creative Commons - Attribution - Non-Commercial license.
 * https://creativecommons.org/licenses/by-nc/3.0/
 */
 
 // Parameter Section //
//-------------------//

/* [Bushing Settings] */
include <BEARINGS.inc>

Bearing = LM10LUU;
inner_diameter_offset = 0; // +/- off of spec
outer_diameter_offset = -0.25; // +/- off of spec
bearing_length_offset = -45; // +/- off of spec

// Use the outer diameter of the rod + tolerance value of your printer. Do some test prints before print a whole set of bushings. Best way in my case is to choose the bushing where can push it in with some effort on the rod and slide it by hand without any tools. Then slide it back and forth along the rod, until the bushing has the expected behavior. I suggest you not to use any drill or heat. The sliding of the bushing generates enough heat from its friction against the rod. Standard values: 6.00 for LM6(L)UU, 8.00 (default 8.15) for LM8(L)UU, 10.00 for LM10(L)UU, 12.00 for LM12(L)UU, 16.00 for LM16UU, ...
inner_diameter_in_millimeter = 8.15;

// Use the inner diameter of housing where the bushing sits + tolerance value of your printer. Depends on the filament you use and the total wall thickness of the bushings, the bushing shouldn't fit to tight in the housing. Standard values: 12.0 for LM6(L)UU, 15.0 (default) for LM8(L)UU, 19.0 for LM10(L)UU, 21.0 for LM12(L)UU, 28.0 for LM16UU, ...
outer_diameter_in_millimeter = 15.0; 

// Standard values: 19.0 for LM6UU, 24.0 for LM8UU, 29.0 for LM10UU, 30.0 for LM12UU, 35.0 for LM6LUU, 37.0 for LM16UU, 45.0 for LM8LUU, 55.0 for LM10LUU, 57.0 for LM12LUU, ...
bushing_length_in_millimeter = 24.0;

// Use a value to get straight primeters without any zigzag between the outer and inner perimeter. I use the value of 0.48 for 0.4 nozzle. This is the auto extrusion width of 0.48 of simplify3d. More information about this in the description of this design on thingiverse.
extrusion_width_in_millimeter = 0.48; 

// Use even numbers. E.g. 4 for LM8(L)UU. Don't forget to set the perimeter number in your Slicer! 
number_of_perimeters = 4; //[2:2:10]

// Choose a number to provide a gap between the teeth in the bushing. E.g. 8 or 10 for LM8(L)UU. The tooth width depends on the extrusion_width_in_millimeter and the number_of_perimeters.
number_of_teeth = 10; //[3:20]

// Radius of the chamfer. Set a chamfer if you want to insert the rod easier. This also helps if your prints tends to create elephant foot in the first few layers. A value between 0.3 and 1.0 might be a good value. Set a value above 0 might destroy the preview of the bushing. But the resulting stl-File will be correct.
chamfer_radius_in_millimeter = 0.4;

/* [Hidden] */
// inner_dia = 2*getRBearingInner(Bearing) + inner_diameter_offset;
// outer_dia = 2*getRBearingOuter(Bearing) + outer_diameter_offset;
// bushing_length = getLBearing(Bearing) + bearing_length_offset;
// extrusion_width = extrusion_width_in_millimeter;
// perimeters = number_of_perimeters;
// teeth = number_of_teeth;
// chamfer_radius = chamfer_radius_in_millimeter;
$fn=100;

 // Program Section //
//-----------------//

for (i=[0:1]) {
    for (j=[0:1]) {
	translate([25*i,25*j,0]) {
	    echo ("i=", i, " j=", j, " offset=",(0.30 + 0.10*(i+2*j)), " height=", 10 + 3*(i+2*j));
	    bushing(2*getRBearingInner(Bearing) + 0.30 + 0.10*(i+2*j),
		2*getRBearingOuter(Bearing) + outer_diameter_offset,
		getLBearing(Bearing) -45 + 3*(i+2*j),
		extrusion_width_in_millimeter,
		number_of_perimeters,
		number_of_teeth,
		chamfer_radius_in_millimeter);
	}
    }
}


// Module Section //
//----------------//

module bushing(inner_dia,outer_dia,bushing_length,extrusion_width,perimeters,teeth,chamfer_radius) {
    difference() {
	translate([0, 0, bushing_length / 2]) {
            difference() {
		union() {
                    difference() {
			for(tooth = [0 : teeth - 1])
			rotate([0, 0, 360 / teeth * tooth]) {
                            translate([outer_dia / 2, 0, 0]) {
				cube([outer_dia / 2, extrusion_width * perimeters, bushing_length + 1], center = true);
                            }
			}
			ring(outer_dia * 2, outer_dia, bushing_length + 2);
                    }
                    ring(outer_dia, outer_dia - extrusion_width * perimeters * 2, bushing_length + 2);
		}
		cylinder(d = inner_dia, h = bushing_length + 2, center = true);
		translate([0, 0, bushing_length / 2]) {
                    cylinder(d = outer_dia + 1, h = 2, $f = 16);
		}
		translate([0, 0, -(bushing_length / 2 + 2)]) {
                    cylinder(d = outer_dia + 1, h = 2, $f = 16);
		}
            }
	}
	chamfer_cut(outer_dia, inner_dia, chamfer_radius);
	translate([0, 0, bushing_length]) {
	    rotate([180,0,0]) {
		chamfer_cut(outer_dia, inner_dia, chamfer_radius);
	    }
	}
    }
}

module ring(d1, d2, height) {
    difference() {
        cylinder(d = d1, h = height, center = true);
        cylinder(d = d2, h = height, center = true);
    }
}

module chamfer_cut(outer_dia, inner_dia, chamfer_radius) {
    if (chamfer_radius > 0) {
	union() {
            difference() {
		translate([0, 0, -1]) {
                    cylinder(d = outer_dia + 1, h = chamfer_radius + 1);
		}
		intersection() {
                    cylinder(d = outer_dia, h = chamfer_radius);
                    cylinder(d1 = outer_dia - chamfer_radius * 2, d2 = outer_dia, h = chamfer_radius);
		}
            }
            translate([0, 0, -chamfer_radius]) {
		intersection() {
                    cylinder(d = inner_dia + chamfer_radius * 4, h = chamfer_radius * 2);
                    cylinder(d1 = inner_dia + chamfer_radius * 4, d2 = inner_dia, h = chamfer_radius * 2);
		}
            }
            translate([0, 0, -2]) {
		cylinder(d = outer_dia + 1, h = 2);
            }
	}
    }
}
