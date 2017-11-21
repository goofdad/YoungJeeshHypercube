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

include <BEARINGS.inc>
 
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
