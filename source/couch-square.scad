
use <bolts.scad>;
use <zcube.scad>;

module boxes() {
	translate([300, -300, 0]) {
		translate([0, -300, 0]) zcube([380, 490, 320]);
		translate([0, 300, 0]) zcube([380, 490, 320]);
		translate([0, -250-650, 0]) zcube([380, 490, 320]);
	}
}

module box_leg(thickness=42) {
	translate([-300+(42/2), 0, 0]) zcube([42, thickness, 400]);
	translate([300-(42/2), 0, 0]) zcube([42, thickness, 400]);
	
	translate([0, 0, 42]) zcube([600-42*2, thickness, 42]);
	translate([0, 0, 400-42]) zcube([600-42*2, thickness, 42]);
}

module back(size=1200) {
	translate([-42/2, 0, 0]) {
		offset = 600-42/2;
		//translate([-(300+42/2), 0, 0]) 
		color("goldenrod") {
			translate([0, offset, 0]) zcube([42, 42, 800]);
			translate([0, -offset, 0]) zcube([42, 42, 800]);
			
			for (i=[0:3]) {
				zcube([42, 1200-42*2, 42], z=800-42-i*100);
			}
		}
		
		color("white") {
			translate([50+42/2, 0, 400+19+100]) zcube([100, 1200, 300]);
		}
	}
}

module base(size=1200) {
	color("goldenrod") {
		translate([-155, 0, 400]) zcube([290, size, 19]);
		translate([0, 0, 400]) zcube([20, size, 19]);
		translate([155, 0, 400]) zcube([290, size, 19]);
		
		translate([0, -(size/2-21), 0]) box_leg();
		translate([0, (size/2-21), 0]) box_leg();
		
		if (size == 1200) {
			box_leg(42*2);
		}
		
		/*
		translate([-300+(25/2), 0, 100]) zcube([25, size-125, 100]);
		translate([-300+(25/2), 0, 300]) zcube([25, size-125, 100]);
		*/
	}

	if (size == 600) {
		translate([0, 0, 400+19]) zcube([600, 600, 100]);
	} else if (size == 1200) {
		color("white") {
			translate([0, 0, 400+19]) zcube([600, 1200, 100]);
		}
	}
}

translate([300, -300, 0]) base(1200);
translate([600, 600, 0]) rotate([0, 0, -90]) base(1200);
translate([300, -1200, 0]) base(600);

translate([3000, 300, 0]) rotate([0, 0, -180]) base(1200);
translate([3000-600, 600, 0]) rotate([0, 0, -90]) base(600);

translate([0, 300, 0]) back();
translate([600, 900, 0]) rotate([0, 0, -90]) back();
translate([3000-300, 900, 0]) rotate([0, 0, -90]) back();
