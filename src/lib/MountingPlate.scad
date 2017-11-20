$fn=200;

eps = 0.05;

bigSize = 100;


// plate
thickness = 4.85; //5.0;
length = 62;
width  = 27;
cutOffsetZ = 2;

// big slot
radiusBigSlot = 6.0;
holeOffsetBigSlot = 32;

// small closed slot
radiusSmallSlot = 2.5;
lengthSmallClosedSlot = 4.0;
holeOffsetSmallClosedSlot = 6;

// small open slot
lengthSmallOpenSlot = 10.0;
holeOffsetSmallOpenSlot = 54;

// side cut
radiusSideCut = 4.5;
fanSize = 40; 
lengthSideCut = fanSize - 2 * radiusSideCut + 4; 
holeOffsetSideCut = holeOffsetBigSlot-lengthSideCut/2;



module drawSideCut()
{
	translate([holeOffsetSideCut,width,-eps]) 
	{
		cylinder(h=thickness+2*eps, r=radiusSideCut);
		translate([0,-radiusSideCut,0]) cube([lengthSideCut,radiusSideCut*2,thickness+2*eps]);
		translate([lengthSideCut,0,0]) cylinder(h=thickness+2*eps, r=radiusSideCut);
	}
}


module drawSmallClosedSlot()
{
	translate([holeOffsetSmallClosedSlot,width/2,-eps]) 
	{
		cylinder(h=thickness+2*eps, r=radiusSmallSlot);
		translate([0,-radiusSmallSlot,0]) cube([lengthSmallClosedSlot,radiusSmallSlot*2,thickness+2*eps]);
		translate([lengthSmallClosedSlot,0,0]) cylinder(h=thickness+2*eps, r=radiusSmallSlot);
	}
}


module drawSmallOpenSlot()
{
	translate([holeOffsetSmallOpenSlot,width/2,-eps]) 
	{
		cylinder(h=thickness+2*eps, r=radiusSmallSlot);
		translate([0,-radiusSmallSlot,0]) cube([lengthSmallOpenSlot,radiusSmallSlot*2,thickness+2*eps]);
	}
}


module drawBigSlot()
{
	translate([holeOffsetBigSlot,width/2,-eps]) 
	{
		cylinder(h=thickness+2*eps, r=radiusBigSlot);
		translate([-radiusBigSlot,0,0]) cube([2*radiusBigSlot,width/2+eps,thickness+2*eps]);
	}
}


module drawBasePlate()
{
	difference()
	{
		union()
		{
			cube([length, width, thickness]);
		}
		union()
		{
			translate([0,-bigSize/2,cutOffsetZ]) rotate([0,-45,0]) cube([bigSize, bigSize, bigSize]);
			translate([length,-bigSize/2,cutOffsetZ]) rotate([0,-45,0]) cube([bigSize, bigSize, bigSize]);	
		}
	}
}


module drawMountingPlate()
{
	difference()
	{
		union()
		{
			drawBasePlate();
		}
		union()
		{
			drawBigSlot();
			drawSmallClosedSlot();
			drawSmallOpenSlot();
			drawSideCut();
		}
	}
}


drawMountingPlate();



