$fn = 100;
eps = 0.01;
bigSize = 500;

rScrewHole = 3.0/2;
rScrewHead = 5.5/2;
distHoles = 32.0;
width = 40.0;
rFillet = (width - distHoles)/2;
thicknessBracket = 3.0;
thicknessTorus = 3.0;
rHoleInner = (width - thicknessTorus)/2;
rTorus = 0.5 * width;
angleTorus = 60;
offsetTorus = -5.0;



module drawTorus(rTorus,rCylinder,eps=0) {
	rotate([0,0,270]) {
		rotate_extrude(angle=-angleTorus-eps, convexity = 10, $fn = 205) {
					translate([rTorus, 0, 0])
					circle(r = rCylinder, $fn=250);
		}
	}
}


module drawScrewHole()
{
	cylinder(thicknessBracket+2*eps,rScrewHole,rScrewHole,$fn=50);
	translate([0,0,thicknessBracket]) cylinder(bigSize,,rScrewHead,rScrewHead,$fn=50);	
}


module drawFanDuct()
{
	difference()
	{
		union()
		{
			hull() 
			{
				translate([distHoles/2,distHoles/2,0]) cylinder(thicknessBracket,rFillet,rFillet);
				translate([-distHoles/2,distHoles/2,0]) cylinder(thicknessBracket,rFillet,rFillet);
				translate([-distHoles/2,-distHoles/2,0]) cylinder(thicknessBracket,rFillet,rFillet);
				translate([distHoles/2,-distHoles/2,0]) cylinder(thicknessBracket,rFillet,rFillet);
			}
			translate([0,rTorus,offsetTorus]) rotate([0,90,0]) drawTorus(rTorus, width/2);
		}
		union()
		{
			translate([distHoles/2,distHoles/2,-eps]) drawScrewHole();
			translate([-distHoles/2,distHoles/2,-eps]) drawScrewHole();
			translate([-distHoles/2,-distHoles/2,-eps]) drawScrewHole();
			translate([distHoles/2,-distHoles/2,-eps]) drawScrewHole();
			translate([0,rTorus,offsetTorus]) rotate([0,90,0]) drawTorus(rTorus,rHoleInner,eps);
			translate([-bigSize/2,distHoles/2-rScrewHead,thicknessBracket]) cube([bigSize,bigSize,bigSize]);
			translate([0,0,-bigSize/2]) cube([bigSize,bigSize,bigSize],true);
		}
	}
}



drawFanDuct();