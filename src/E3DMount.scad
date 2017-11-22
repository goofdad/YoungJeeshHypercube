include <lib/HyperQbert.inc>

module e3d() {
    translate([20,-23.25,0]) rotate([0,0,90]) difference() {
	translate([-65,-12,-8.2]) import ("e3d_mount.stl");
	translate([-70,-40,-10]) cube([200,200,10]);
    }
}

e3dCarriage();

module e3dCarriage() {
    offsetX = distBetweenXRods/2-rScrew-calcScrewFlesh(rScrew)/2-getRBearingOuter(BearingX);
    xMountPlate = offsetX + tPlastic * 2 + 10;
    yMountPlate = distExtruderMountHoles + tPlastic * 2 + 10;
    union () {
	difference() {
	    translate([-xMountPlate/2, -yMountPlate/2, -tPlastic]) cube([xMountPlate, yMountPlate, tPlastic+eps]);
	    translate([-offsetX/2,distExtruderMountHoles/2,0]) drawExtruderMountHole();
	    translate([-offsetX/2,0,0]) drawExtruderMountHole();
	    translate([-offsetX/2,-distExtruderMountHoles/2,0]) drawExtruderMountHole();
	    translate([0,distExtruderMountHoles/2,0]) drawExtruderMountHole();
	    translate([0,0,0]) drawExtruderMountHole();
	    translate([0,-distExtruderMountHoles/2,0]) drawExtruderMountHole();			
	    // translate([offsetX/2,distExtruderMountHoles/2,0]) drawExtruderMountHole();
	    // translate([offsetX/2,0,0]) drawExtruderMountHole();
	    // translate([offsetX/2,-distExtruderMountHoles/2,0]) drawExtruderMountHole();
	}
	e3d();
    }
}




//import ("e3d_clamp.stl");


