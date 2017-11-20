$fn = 250;
eps = 0.01;
bigSize = 500;


 
t = 1.0;
w = 40.0;
holeDistance = 32.0;
rFanHole = 38/2;
rScrewHole = 3.0/2;

overlap = 0.5;


module drawFanSeal()
{
	difference()
	{
		union()
		{
			cube([w+2*overlap,w+2*overlap,t],true);
		}
		union()
		{
			cylinder(bigSize,rFanHole-overlap,rFanHole-overlap,true);
			translate([holeDistance/2,holeDistance/2,0]) cylinder(bigSize,rScrewHole,rScrewHole,true);
			translate([-holeDistance/2,holeDistance/2,0]) cylinder(bigSize,rScrewHole,rScrewHole,true);
			translate([holeDistance/2,-holeDistance/2,0]) cylinder(bigSize,rScrewHole,rScrewHole,true);
			translate([-holeDistance/2,-holeDistance/2,0]) cylinder(bigSize,rScrewHole,rScrewHole,true);
		}
	}
}



drawFanSeal();
