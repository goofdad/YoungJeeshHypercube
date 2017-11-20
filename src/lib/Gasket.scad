$fn = 200;

eps = 0.01;
bigSize = 100;



rOuter = 27.5/2;
rInner = 15.5/2;
w = 13.0;
h = 11.0;
h2 = 6.0;



module drawJHead()
{
	difference()
	{
		union()
		{
			cylinder(h+2*eps,rInner, rInner);
		}
		union()
		{
			translate([w/2,-bigSize/2,-eps]) cube([bigSize,bigSize,h2+eps]);
			mirror([1,0,0]) translate([w/2,-bigSize/2,-eps]) cube([bigSize,bigSize,h2+eps]);
		}
	}
}


module drawGasket() 
{
	difference()
	{
		union()
		{
			cylinder(h,rOuter, rOuter);
		}
		union()
		{
			translate([0,0,-eps]) drawJHead();
		}
	}
}



// tests
//drawJHead();


// parts
drawGasket();