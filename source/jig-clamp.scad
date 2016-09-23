
use <bolts.scad>;
use <zcube.scad>;
use <jig.scad>;

height = 40;

thickness = 4;
tolerance = 0.5;

module alignment_bars() {
	difference() {
		union() {
			translate([0, 2*(42/2)+tolerance, 0]) rotate([0, 0, 45]) zcube([2, 2, height]);

			for (i=[0:1.0:1]) {
				translate([-42/2-tolerance, i*(42/2), 0]) rotate([0, 0, 45]) zcube([2, 2, height]);
				translate([42/2+tolerance, i*(42/2), 0]) rotate([0, 0, 45]) zcube([2, 2, height]);
			}
		}
		
		zcube([42+tolerance*2, 42*2+tolerance*2, height/2], z=25);
	}
}

module crossbeam() {
	difference() {
		union() {
			zcube([42+tolerance*2+thickness*2, 6, 2]);
			translate([0, 42/2, 0]) zcube([42+tolerance*2, 6, 2]);
			translate([0, 42/2, 0]) zcube([6, 42+tolerance*2+5, 2]);
		}
		
		hole(3);
		translate([0, 42/2, 0]) hole(3);
	}
}

render() difference() {
	inner_size = [42+tolerance*2, 42*2+tolerance*2, height];
	outer_size = [inner_size[0]+thickness*2, inner_size[1]+thickness*2, height];
	
	union() {
		difference() {
			zcube(outer_size);
			zcube(inner_size);
		}
		
		alignment_bars();
	}
	
	translate([0, -outer_size[1]/2, 0]) zcube(outer_size);
}

crossbeam();

// translate([0, 0, 2]) jig();