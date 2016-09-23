
use <bolts.scad>;
use <zcube.scad>;

// suitable for 688ZZ bearings
bearing_diameter = 16;
inner_diameter = bearing_diameter * 0.9;
bearing_depth = 5;

height = 25;

module bearing_cutout() {
	cylinder_outer(height, bearing_diameter/2);
//	cylinder_outer(bearing_depth, bearing_diameter/2);
//	translate([0, 0, height - bearing_depth]) cylinder_outer(bearing_depth, bearing_diameter/2);
}

module jig() {
	difference() {
		zcube([42, 42*2, height]);
		
		for (i=[-1.5:1.0:1.5]) {
			translate([42/4, i*(42/2), 0]) bearing_cutout(height);
			translate([-42/4, i*(42/2), 0]) bearing_cutout(height);
		}
		
		for (i=[-2:1.0:2]) {
			translate([0, i*(42/2), 0]) rotate([0, 0, 45]) zcube([2, 2, height]);
			translate([-42/2, i*(42/2), 0]) rotate([0, 0, 45]) zcube([2, 2, height]);
			translate([42/2, i*(42/2), 0]) rotate([0, 0, 45]) zcube([2, 2, height]);
		}
	}
}

jig();