$fn = 200;

difference() {
    translate([0,-31,0])cube([102-15,62,2]);
    translate([22,-10,-0.5])cube([40,35,3]);
    translate([9,-26,0])cylinder(r = 2, h = 20);
    translate([9,26,0])cylinder(r = 2, h = 20);
    translate([66,-26])cylinder(r = 2, h = 20);
    translate([66,26,0])cylinder(r = 2, h = 20);
}

translate([87,18,0])cylinder(r = 15, h = 2);
translate([87,-18,0])cylinder(r = 15, h = 2);
translate([87,-18,0])cube([15,35,2]);
    

translate([2,-31,0])cylinder(r = 2, h = 10);
translate([2,31,0])cylinder(r = 2, h = 10);

difference() {
    translate([0,-31,0])cube([2,62,10]);
    translate([0,0,5])rotate([0,90,0])cylinder(d=6, h = 5);
}

translate([2,-33,0])cube([85,2,10]);
translate([2,31,0])cube([85,2,10]);

difference() {
    union() {
        translate([9,-26,0])cylinder(r = 5, h = 10);
        translate([9,26,0])cylinder(r = 5, h = 10);
        translate([66,-26])cylinder(r = 5, h = 10);
        translate([66,26,0])cylinder(r = 5, h = 10);
        
        translate([9,-26,0])cylinder(r = 3, h = 14);
        translate([9,26,0])cylinder(r = 3, h = 14);
        translate([66,-26])cylinder(r = 3, h = 12);
        translate([66,26,0])cylinder(r = 3, h = 12);
    }
    translate([9,-26,0])cylinder(r = 2, h = 20);
    translate([9,26,0])cylinder(r = 2, h = 20);
    translate([66,-26])cylinder(r = 2, h = 20);
    translate([66,26,0])cylinder(r = 2, h = 20);
}

/*
intersection() {
    difference() {
        translate([67,18,0])cylinder(r = 15, h = 10);
        translate([67,18,0])cylinder(r = 13, h = 10);
    }
    translate([67,18,0])cube([15,15,10]);
}

intersection() {
    difference() {
        translate([67,-18,0])cylinder(r = 15, h = 10);
        translate([67,-18,0])cylinder(r = 13, h = 10);
    }
    translate([67,-18-15,0])cube([15,15,10]);
}
*/

intersection() {
    difference() {
        translate([87,18,0])cylinder(r = 15, h = 34);
        translate([87,18,0])cylinder(r = 13, h = 34);
    }
    translate([87,18,0])cube([15,15,34]);
}

intersection() {
    difference() {
        translate([87,-18,0])cylinder(r = 15, h = 34);
        translate([87,-18,0])cylinder(r = 13, h = 34);
    }
    translate([87,-18-15,0])cube([15,15,34]);
}

difference() {
    translate([67,31,0])cube([20,2,34]);
    translate([67,18,0])cylinder(r1 = 15, r2 = 15.2, h = 34);
}

difference() {
    translate([67,-33,0])cube([20,2,34]);
    translate([67,-18,0])cylinder(r1 = 15, r2 = 15.2, h = 34);
}

difference() {
    translate([100,-18,0])cube([2,36,34]);
    translate([91.6,0,21])rotate([0,90,0])sphere(d=30);
    //translate([99,0,21])rotate([0,90,0])resize([15,20])cylinder(d=20, h=5);
}

/*
difference() {
    union() {
        translate([87,18,33])cylinder(r = 15, h = 1);
        translate([87,-18,33])cylinder(r = 15, h = 1);
        translate([87,-18,33])cube([15,35,1]);
        translate([87-20,-18-15,33])cube([20,66,1]);
    }
translate([67,-18,31])cylinder(r1 = 15, r2 = 15.2, h = 10);
translate([67,18,31])cylinder(r1 = 15, r2 = 15.2, h = 12);
translate([67,-18,31])cube([15,35,3]);
}*/
//translate([81,-17.5,33])cube([15,35,1]);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
