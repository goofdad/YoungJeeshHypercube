$fn=200;

eps = 0.05;

big_cut_size = 200; // not important as long as big enough


// blower
blower_height = 10;
blower_radius1 = 13.5;
blower_radius2 = 25;
blower_torus_hole_radius = 3;
blower_pipe_hole_radius = 1.2;
blower_pipe_length = 15;
blower_pipe_radius = 14;
blower_pipe_angle = 60;
nr_of_pipes = 12;
blower_offset_z = 1;
blower_wall_thickness = 2;

// screw holes
screw_radius = 1.5;
screw_length = 9;

// middle fan mount
middle_fan_mount_depth = 27;
middle_fan_mount_screw_hole_distance = 32;
middle_fan_mount_size = 40;
middle_fan_mount_cylinder_depth = 6;
middle_fan_mount_cone_depth = 10 - middle_fan_mount_cylinder_depth;
middle_fan_mount_radius1 = 15;
middle_fan_mount_radius2 = 18;
middle_fan_mount_dist = (middle_fan_mount_size - middle_fan_mount_screw_hole_distance)/2;
middle_fan_mount_extra_cut = 4; // only needed if middle_fan_mount_depth is small


// middle part
middle_radius = 30/2;
middle_height = 26;
middle_cooling_hole_radius = 2.5;
middle_cooling_hole_length = 20;
nr_of_vertical_cooling_holes = 3;
nr_of_horizontal_cooling_holes = 3;

// wade mount
hole_distance = 49;
wade_radius = 7;
wade_screw_radius = 2.0;
wade_cube_depth = hole_distance/2 - blower_radius1;
wade_cylinder_cut_height = middle_height + blower_height - 5;
wade_cut_width = 28 + 2;


// bottom fan mount
bottom_fan_mount_size = 40; //30; //40
bottom_fan_mount_screw_hole_distance = 32; //24; //32;
bottom_fan_mount_offset_y = 94/2;
bottom_fan_mount_depth = 10;
bottom_fan_mount_radius = bottom_fan_mount_screw_hole_distance/2 + 1;
bottom_fan_mount_dist = (bottom_fan_mount_size - bottom_fan_mount_screw_hole_distance)/2;

// funnel
funnel_top_radius = 10;
funnel_bottom_radius = 4;
funnel_wall_thickness = 1;
funnel_wall_ridge_width = 1;
funnel_width = bottom_fan_mount_size - 2 * funnel_wall_ridge_width/2;

funnel_height_mid_part_big = bottom_fan_mount_size - funnel_wall_ridge_width - funnel_top_radius;
funnel_height_mid_part_small = funnel_height_mid_part_big - blower_height - funnel_bottom_radius;

funnel_airhole_radius = blower_height/2-2*funnel_wall_thickness;


// probe
//include <LJ12A3-4-Z.inc>;
include <LJ18A3-8-Z.inc>;
offsetProbe = 10.0;


module drawTorus(radius, radiusCylinder) {
	rotate([0,0,180]) {
		rotate_extrude(convexity = 10, $fn = 100) {
					translate([radius, 0, 0])
					circle(r = radiusCylinder);
		}
	}
}


module drawFunnelTop()
{
	difference()
	{
		union()
		{
			translate([-funnel_width/2,0,bottom_fan_mount_size-funnel_top_radius-funnel_wall_ridge_width]) rotate([0,90,0]) cylinder(h=funnel_width, r=funnel_top_radius);
		}
		union()
		{
			translate([-big_cut_size/2,-big_cut_size,0]) cube([big_cut_size,big_cut_size,big_cut_size]);
			translate([-big_cut_size/2,-big_cut_size/2,-big_cut_size+bottom_fan_mount_size-funnel_top_radius-funnel_wall_ridge_width]) cube([big_cut_size,big_cut_size,big_cut_size]);
			translate([-funnel_width/2+funnel_wall_thickness,0,bottom_fan_mount_size-funnel_top_radius-funnel_wall_ridge_width]) rotate([0,90,0]) cylinder(h=funnel_width-2*funnel_wall_thickness, r=funnel_top_radius-funnel_wall_thickness);
		}
	}
}


module drawFunnelBottomSupportAirHole()
{
	translate([0,funnel_top_radius-funnel_wall_thickness,blower_height/2]) rotate([-90,0,0]) translate([0,0,-eps]) cylinder(h=bottom_fan_mount_offset_y+2*eps, r=funnel_airhole_radius);
}


module drawFunnelAirHoles()
{
	pos=funnel_width/2-funnel_airhole_radius-funnel_wall_thickness;
	translate([-pos,0,0]) drawFunnelBottomSupportAirHole();
	translate([0,0,0]) drawFunnelBottomSupportAirHole();
	translate([pos,0,0]) drawFunnelBottomSupportAirHole();
	if (pos > 3*funnel_airhole_radius + 2*funnel_wall_thickness) {
		translate([-pos/2,0,0]) drawFunnelBottomSupportAirHole();
		translate([pos/2,0,0]) drawFunnelBottomSupportAirHole();
	}
}


module drawFunnelBottom()
{
	difference()
	{
		union()
		{
			// rectangular part
			if (funnel_height_mid_part_small > 0) {
				translate([-funnel_width/2,funnel_top_radius-funnel_wall_thickness,blower_height+funnel_bottom_radius]) cube([funnel_width,funnel_wall_thickness,funnel_height_mid_part_small]);
			}
			//right plate
			translate([funnel_width/2-funnel_wall_thickness,0,0]) cube([funnel_wall_thickness,bottom_fan_mount_offset_y,funnel_height_mid_part_big]);
			//left plate
			translate([-funnel_width/2,0,0]) cube([funnel_wall_thickness,bottom_fan_mount_offset_y,funnel_height_mid_part_big]);

			// bottom plate
			translate([-funnel_width/2,0,0]) cube([funnel_width,bottom_fan_mount_offset_y,funnel_wall_thickness]);

			// solid box
			translate([-funnel_width/2,funnel_top_radius-funnel_wall_thickness,0]) cube([funnel_width,bottom_fan_mount_offset_y,funnel_height_mid_part_big]);

			// circular part
			translate([-funnel_width/2,funnel_bottom_radius+funnel_top_radius,blower_height+funnel_bottom_radius]) rotate([0,90,0]) cylinder(h=funnel_width, r=funnel_bottom_radius+funnel_wall_thickness);
		}
		union()
		{
			translate([-big_cut_size/2,funnel_bottom_radius+funnel_top_radius,blower_height]) cube([big_cut_size,big_cut_size,big_cut_size]);
			translate([-big_cut_size/2,funnel_top_radius,blower_height+funnel_bottom_radius]) cube([big_cut_size,big_cut_size,big_cut_size]);
			translate([-funnel_width/2-eps,funnel_bottom_radius+funnel_top_radius,blower_height+funnel_bottom_radius]) rotate([0,90,0]) cylinder(h=funnel_width+2*eps, r=funnel_bottom_radius);
			drawFunnelAirHoles();
		}
	}
}


module drawFunnel()
{
	drawFunnelTop();
	drawFunnelBottom();
}


module drawScrewHoleBottomFanMount()
{
	rotate([-90,0,0]) translate([0,0,-eps]) cylinder(h=screw_length+eps, r=screw_radius);
}


module drawBottomFanMount()
{
	difference()
	{
		union()
		{
			translate([-bottom_fan_mount_size/2,0,0]) cube([bottom_fan_mount_size,bottom_fan_mount_depth, bottom_fan_mount_size]);
		}

		union()
		{
			// big hole
			translate([0,0,bottom_fan_mount_size/2]) rotate([-90,0,0]) translate([0,0,-eps]) cylinder(h=bottom_fan_mount_depth+2*eps, r=bottom_fan_mount_radius);

			// screw holes
			translate([bottom_fan_mount_size/2-bottom_fan_mount_dist,0,bottom_fan_mount_dist]) drawScrewHoleBottomFanMount();
			translate([-bottom_fan_mount_size/2+bottom_fan_mount_dist,0,bottom_fan_mount_dist]) drawScrewHoleBottomFanMount();
			translate([bottom_fan_mount_size/2-bottom_fan_mount_dist,0,bottom_fan_mount_size-bottom_fan_mount_dist]) drawScrewHoleBottomFanMount();
			translate([-bottom_fan_mount_size/2+bottom_fan_mount_dist,0,bottom_fan_mount_size-bottom_fan_mount_dist]) drawScrewHoleBottomFanMount();
		}
	}
}


module drawBottomPart()
{
	drawBottomFanMount();
	translate([0,bottom_fan_mount_depth,0]) drawFunnel();
}


module drawScrewHoleMiddleFanMount()
{
	translate([middle_fan_mount_depth-screw_length,0,0]) rotate([0,90,0]) translate([0,0,eps]) cylinder(h=screw_length+eps, r=screw_radius);
}


module drawMiddleFanMount()
{
	difference()
	{
		union()
		{
			translate([0,-middle_fan_mount_size/2,0]) cube([middle_fan_mount_depth,middle_fan_mount_size,middle_fan_mount_size]);
		}

		union()
		{
			// screw holes
			translate([0,middle_fan_mount_size/2-middle_fan_mount_dist,middle_fan_mount_dist]) drawScrewHoleMiddleFanMount();
			translate([0,-middle_fan_mount_size/2+middle_fan_mount_dist,middle_fan_mount_dist]) drawScrewHoleMiddleFanMount();
			translate([0,middle_fan_mount_size/2-middle_fan_mount_dist,middle_fan_mount_size-middle_fan_mount_dist]) drawScrewHoleMiddleFanMount();
			translate([0,-middle_fan_mount_size/2+middle_fan_mount_dist,middle_fan_mount_size-middle_fan_mount_dist]) drawScrewHoleMiddleFanMount();

			// hole in fanmount
			translate([0,0,-eps]) cylinder(h=blower_height+2*eps, r=blower_radius2);
		}
	}
}


module drawCoolingHole()
{
	translate([-middle_fan_mount_size/2,0,0]) rotate([0,90,0]) translate([0,0,-middle_cooling_hole_length/2]) cylinder(h=middle_cooling_hole_length, r=middle_cooling_hole_radius);
}


module drawWadeScrewHelperHole()
{
	cylinder(h=wade_cylinder_cut_height+blower_height, r=2.5*wade_screw_radius);
}


module drawWadeMount() {
	difference()
	{
		union()
		{
			cylinder(h=middle_height+blower_height, r=wade_radius);
			translate([-wade_radius,0,blower_height]) cube([2*wade_radius, wade_cube_depth, middle_height]);
		}
		union()
		{
			translate([0,0,-blower_height]) drawWadeScrewHelperHole();
			translate([wade_screw_radius,0,-eps]) cylinder(h=middle_height+blower_height+2*eps, r=wade_screw_radius);
			translate([-wade_screw_radius,-wade_screw_radius,-eps]) cube([2*wade_screw_radius, 2*wade_screw_radius,middle_height+blower_height+2*eps]);
			translate([-wade_screw_radius,0,-eps]) cylinder(h=middle_height+blower_height+2*eps, r=wade_screw_radius);
		}
	}
}


module drawMiddlePart()
{
	difference()
	{
		union()
		{
			translate([0,0,-blower_height]) drawMiddleFanMount();
			cylinder(h=middle_height, r=middle_radius);
			translate([0,-hole_distance/2,-blower_height]) drawWadeMount();
			rotate([0,0,180]) translate([0,-hole_distance/2,-blower_height]) drawWadeMount();
		}
		union()
		{
			// vertical cylindric hole
			translate([0,0,-eps]) cylinder(h=middle_height+2*eps, r=blower_radius1);			

			// horizontal cylindric hole outside
			translate([middle_fan_mount_depth-middle_fan_mount_cylinder_depth-eps,0,middle_fan_mount_size/2-blower_height]) rotate([0,90,0]) cylinder(h=middle_fan_mount_cylinder_depth+2*eps, r1=middle_fan_mount_radius2, r2=middle_fan_mount_radius2);

			// horizontal cone
			translate([middle_fan_mount_depth-middle_fan_mount_cylinder_depth-middle_fan_mount_cone_depth-eps,0,middle_fan_mount_size/2-blower_height]) rotate([0,90,0]) cylinder(h=middle_fan_mount_cone_depth+2*eps, r1=middle_fan_mount_radius1, r2=middle_fan_mount_radius2);

			// horizontal cylindric hole inside
			translate([0,0,middle_fan_mount_size/2-blower_height]) rotate([0,90,0]) cylinder(h=middle_fan_mount_depth, r=middle_fan_mount_radius1);

			// top cuts
			difference() 
			{
				union()
				{
					translate([middle_fan_mount_extra_cut,0,middle_fan_mount_size/2]) cylinder(h=middle_fan_mount_size/2+eps, r=blower_radius1);
					translate([0,-blower_radius1,middle_fan_mount_size/2]) cube([middle_fan_mount_extra_cut,2*blower_radius1,middle_fan_mount_size/2]);
				}
				union()
				{
					translate([-middle_fan_mount_size,-middle_fan_mount_size/2,middle_fan_mount_size/2]) cube([middle_fan_mount_size,middle_fan_mount_size,middle_fan_mount_size]);
				}
			}

			// wade plate
			translate([-blower_radius1-blower_wall_thickness,-middle_fan_mount_size/2-eps,middle_height]) cube([wade_cut_width,middle_fan_mount_size+2*eps,middle_fan_mount_size]);

			// cooling holes
			for (count = [0:nr_of_horizontal_cooling_holes-1]) {
				rotationZ = 90 * (count / (nr_of_horizontal_cooling_holes-1));
				offset = -45;
				for (count_z = [1:nr_of_vertical_cooling_holes]) {
					dist_z = count_z*middle_height/nr_of_vertical_cooling_holes-middle_height/(2*nr_of_vertical_cooling_holes);
					rotate([0,0,rotationZ+offset]) translate([0,0,dist_z]) drawCoolingHole();
				}
			}
		}
	}
}


module drawPipe()
{
	translate([0,0,blower_offset_z]) rotate([0,blower_pipe_angle,0]) translate([0,0,-blower_pipe_length/2]) cylinder(h=blower_pipe_length, r=blower_pipe_hole_radius);
}


module drawBlower()
{
	difference()
	{
		union()
		{
			cylinder(h=blower_height, r=blower_radius2);
		}

		union()
		{	
			translate([0,0,-eps]) cylinder(h=blower_height+2*eps, r=blower_radius1);
			translate([0,0,blower_height/2]) drawTorus((blower_radius2+blower_radius1)/2, blower_torus_hole_radius);
			for (count = [0:nr_of_pipes-1]) {
				rotationZ = 360 * (count / nr_of_pipes);
				offset = 180 / nr_of_pipes;
				rotate([0,0,rotationZ+offset]) translate([blower_pipe_radius,0,0]) drawPipe();
			}
		}
	}
}


module drawProbeMount()
{
	translate([0,0,h_probe_dist_from_ground]) difference()
	{
		union()
		{
			translate([-r_probe_washer,-r_probe_washer,0]) cube([r_probe_washer+offsetProbe,2*r_probe_washer,h_probe_mount]);
			wy = bottom_fan_mount_offset_y-middle_fan_mount_size/2-bottom_fan_mount_depth;
			translate([-r_probe_washer-funnel_wall_ridge_width+eps,r_probe_washer-wy,0]) cube([funnel_wall_ridge_width+eps,wy,h_probe_mount]);
			translate([offsetProbe,0,0]) cylinder(h_probe_mount,r_probe_washer,r_probe_washer);
		}
		union()
		{
			translate([offsetProbe,0,-big_cut_size/2]) cylinder(big_cut_size,r_probe,r_probe);
		}
	}
}


module assembly() {
	difference() 
	{
		union()
		{
			difference(){
				translate([0,-bottom_fan_mount_offset_y,0]) drawBottomPart();
				translate([-big_cut_size/2,blower_wall_thickness,0]) cube([big_cut_size,big_cut_size,big_cut_size]);
			}
			difference(){
				rotate([0,0,180]) translate([0,-bottom_fan_mount_offset_y,0]) drawBottomPart();
				translate([-big_cut_size/2,-big_cut_size,0]) cube([big_cut_size,big_cut_size,big_cut_size]);
			}
		}
		union()
		{
			translate([0,0,-eps]) cylinder(h=blower_height+2*eps,r=blower_radius2);
		}
	}


	difference() 
	{
		union()
		{
			drawBlower();
		}
		union()
		{
			difference() 
			{
				union() 
				{
					translate([0,-bottom_fan_mount_depth,0]) drawFunnelAirHoles();
					translate([0,bottom_fan_mount_depth,0]) rotate([0,0,180]) drawFunnelAirHoles();
				}
				union()
				{
					cylinder(h=blower_height,r=blower_radius1+blower_wall_thickness);
				}
			}
		}		
	}

	translate([0,0,blower_height]) drawMiddlePart();

	rotate([0,0,90]) translate([-blower_wall_thickness/2,blower_radius1,0]) cube([blower_wall_thickness,blower_radius2-blower_radius1,blower_height]);
	rotate([0,0,90]) translate([-blower_wall_thickness/2,-blower_radius2,0]) cube([blower_wall_thickness,blower_radius2-blower_radius1,blower_height]);

	translate([bottom_fan_mount_size/2+r_probe_washer-eps,-middle_fan_mount_size/2-r_probe_washer+eps,0]) drawProbeMount();
}


module drawAssembly() {
	difference() {
		assembly();
		translate([0,-hole_distance/2,-blower_height]) drawWadeScrewHelperHole();
		rotate([0,0,180]) translate([0,-hole_distance/2,-blower_height]) drawWadeScrewHelperHole();
	}
}




// tests
//drawBottomPart();
//drawProbeMount();



// parts
drawAssembly();









