// 31.1 Kasten Breite
// 32.6 Breite Aufhängung
gap=6;
hook_y=3;
hook_thickness=3;
plate_thickness=7.4;
top_thickness=2;
draft=1;
bevel_length=1.6;
bevel_shift=(sqrt(2)*bevel_length)/2;

x=plate_thickness+gap+hook_thickness;
y=50;
z=30;

union() {
     difference() {
	  cube([x,y,z]);
	  translate([plate_thickness,-top_thickness,0])
	       cube([gap,y,z]);
	  translate([plate_thickness,0,0])
	       cube([x-plate_thickness,y-top_thickness-hook_y, z]);

	  linear_extrude(height=z)
	       translate([x,y-bevel_shift,0])
	       rotate([0,0,45])
	       square(bevel_length);

	  linear_extrude(height=z)
	       translate([plate_thickness,-bevel_shift,0])
	       rotate([0,0,45])
	       square(bevel_length);

	  #linear_extrude(height=z)
	       translate([plate_thickness+gap,y-hook_y-top_thickness-bevel_shift,0])
	       rotate([0,0,45])
	       square(bevel_length);
      }

     translate([0,0,z])
	  rotate([270,0,0])
	  linear_extrude(height=50)
	  polygon([[-1*draft,0], [0,0],[0,z]]);

     linear_extrude(height=50)
	  translate([x-plate_thickness,0,z])
	  cube(1);

     linear_extrude(height=z)
	  #translate([plate_thickness,y-top_thickness-bevel_shift,0])
	  rotate([0,0,45])
	  square(bevel_length);

     linear_extrude(height=z)
	  translate([plate_thickness+gap,y-top_thickness-bevel_shift,0])
	  rotate([0,0,45])
	  square(bevel_length);
}
