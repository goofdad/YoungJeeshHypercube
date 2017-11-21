include <lib/customizable_linear_bushing.inc>

Bearing = LM10LUU;
inner_diameter_offset = 0; // +/- off of spec
outer_diameter_offset = -0.25; // +/- off of spec
bearing_length_offset = -45; // +/- off of spec

inner_diameter_in_millimeter = 8.15;
outer_diameter_in_millimeter = 15.0; 
bushing_length_in_millimeter = 24.0;
extrusion_width_in_millimeter = 0.48; 
number_of_perimeters = 4; //[2:2:10]
number_of_teeth = 10; //[3:20]
chamfer_radius_in_millimeter = 0.4;
$fn=100;

// Program Section //
//-----------------//

for (i=[0:1]) {
    for (j=[0:1]) {
	translate([25*i,25*j,0]) {
//	    echo ("i=", i, " j=", j, " offset=",(0.30 + 0.10*(i+2*j)), " height=", 10 + 3*(i+2*j));
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


