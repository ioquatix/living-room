
use <bolts.scad>;
use <zcube.scad>;

//translate([0, -250, 0]) zcube([380, 490, 320]);
//translate([0, 250, 0]) zcube([380, 490, 320]);

module base(size=1200) {
	color("goldenrod") {
		translate([-150, 0, 400]) zcube([300, size, 25]);
		translate([150, 0, 400]) zcube([300, size, 25]);

		translate([0, -(size/2-50), 0]) zcube([600, 25, 400]);
		translate([0, (size/2-50), 0]) zcube([600, 25, 400]);
		
		translate([-300+(25/2), 0, 100]) zcube([25, size-125, 100]);
		translate([-300+(25/2), 0, 300]) zcube([25, size-125, 100]);
	}

	if (size == 600) {
		translate([0, 0, 425]) zcube([600, 600, 100]);
	} else if (size == 1200) {
		color("white") {
			translate([0, -300, 425]) zcube([600, 600, 100]);
			translate([0, 300, 425]) zcube([600, 600, 100]);
		}
	}
}

translate([300, -300, 0]) base(1200);
translate([600, 600, 0]) rotate([0, 0, -90]) base(1200);
translate([300, -1200, 0]) base(600);

translate([3000, 300, 0]) rotate([0, 0, -180]) base(1200);
translate([3000-600, 600, 0]) rotate([0, 0, -90]) base(600);