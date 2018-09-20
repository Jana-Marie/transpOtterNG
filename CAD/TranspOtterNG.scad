$fn=30
;

frame3D();

module frame2D(){
    height = 21;
    cutout_depht = 5;
    
    hoverbaord_motor_offset = -210;
    hoverbaord_motor_mount_spacing = -157;
    hoverbaord_motor_spacing = -147;
    
    wheel_offset = 220;
    wheel_spacing = 150;
    
    gametrak_offset = 210;
    
    mainboard_offset = -60;
    mainboard_offset_y = 110;
    mainboard_rotation = 270;
    
    pcb_offset = -60;
    pcb_offset_y = 10; 
    
    battery_offset_x = -60;
    battery_offset_y = -70;
    battery_rotation = 0;
    
    
    difference(){
        union(){
                base2D();

            
        }union(){
            translate([0,0,height-(cutout_depht/2)])
                cutout2D();
            
            
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,0])
                motorplate2D_cutout();
            
            
            mirror([0,1,0])
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,0])
                motorplate2D_cutout();
            
            
            translate([wheel_offset,wheel_spacing,0])
                wheel2D_cutout();
            
                        
            mirror([0,1,0])
            translate([wheel_offset,wheel_spacing,0])           
                wheel2D_cutout();
            
            
            translate([gametrak_offset,0,10])
                gametrak2D();
            
        }
    }
}

module frame3D(){
    height = 21;
    cutout_depht = 5;
    
    hoverbaord_motor_offset = -210;
    hoverbaord_motor_mount_spacing = -157;
    hoverbaord_motor_spacing = -147;
    
    wheel_offset = 220;
    wheel_spacing = 150;
    
    gametrak_offset = 210;
    
    mainboard_offset = -60;
    mainboard_offset_y = 110;
    mainboard_rotation = 270;
    
    pcb_offset = -60;
    pcb_offset_y = 10; 
    
    battery_offset_x = -60;
    battery_offset_y = -70;
    battery_rotation = 0;
    
    difference(){
        union(){
            translate([0,0,height/2])
            linear_extrude(height = height, center = true, convexity = 10,  slices = 20) {
                base2D();
            }
            
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,0])
            color("silver")
            motorplate3D();
                        
            mirror([0,1,0])
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,0])
            color("silver")
            motorplate3D();
            
            translate([hoverbaord_motor_offset,hoverbaord_motor_spacing,-20])
            motor3D();
                        
            mirror([0,1,0])
            translate([hoverbaord_motor_offset,hoverbaord_motor_spacing,-20])
            motor3D();
            
            translate([wheel_offset,wheel_spacing,0])
            wheel3D();
                        
            mirror([0,1,0])
            translate([wheel_offset,wheel_spacing,0])
            wheel3D();
            
            translate([gametrak_offset,0,0])
            gametrak3D();
            
            translate([mainboard_offset,mainboard_offset_y,-1])
            rotate([0,0,mainboard_rotation])
            mainboard3D();
            
            translate([pcb_offset,mainboard_offset_y+pcb_offset_y,-1])
            rotate([0,0,mainboard_rotation])
            pcb3D();

            
        }union(){
            translate([0,0,height-(cutout_depht/2)])
            linear_extrude(height = cutout_depht+0.01, center = true, convexity = 10,  slices = 20) {
                cutout2D();
            }
            
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,height/2])
            linear_extrude(height = height+0.01, center = true, convexity = 10,  slices = 20) {
                motorplate2D_cutout();
            }
            
            mirror([0,1,0])
            translate([hoverbaord_motor_offset,hoverbaord_motor_mount_spacing,height/2])
            linear_extrude(height = height+0.01, center = true, convexity = 10,  slices = 20) {
                motorplate2D_cutout();
            }
            
            translate([wheel_offset,wheel_spacing,10])
            linear_extrude(height = height+0.01, center = true, convexity = 10,  slices = 20) {
                wheel2D_cutout();
            }
                        
            mirror([0,1,0])
            translate([wheel_offset,wheel_spacing,10])           
            linear_extrude(height = height+0.01, center = true, convexity = 10,  slices = 20) {
                wheel2D_cutout();
            }
            
            translate([gametrak_offset,0,10])
            linear_extrude(height = height+0.01, center = true, convexity = 10,  slices = 20) {
                gametrak2D();
            }
        }
    }
    translate([battery_offset_x,battery_offset_y+(72/2)+4,-56/2])
    rotate([0,0,battery_rotation])
    batteryBosch3D();
    
    translate([battery_offset_x,battery_offset_y-(72/2)-4,-56/2])
    rotate([0,0,battery_rotation])
    batteryBosch3D();
}
module base2D(){
    length = 600;
    width = 400;
    rad = 5;
    //handle
    handle_length = 100;
    handle_width = 30;
    handle_offset = 24.5;
    handle_rad = 5;
    difference(){
        union(){
            minkowski(){
                square([length-(rad*2),width-(rad*2)],center=true);
                circle(r=rad);
            }
        }union(){
            //Handle 1
            translate([(length-handle_width-handle_offset)/2,0])
            minkowski(){
                square([handle_width-(handle_rad*2),handle_length-(handle_rad*2)],center=true);
                circle(r=handle_rad);
            }
            //Handle 2
            translate([-60,(-width+handle_width+handle_offset)/2])
            minkowski(){
                square([handle_length-(handle_rad*2),handle_width-(handle_rad*2)],center=true);
                circle(r=handle_rad);
            }
        }
    }
}

module cutout2D(){
    length = 575;
    width = 375;
    rad = 5;
    difference(){
        union(){
            minkowski(){
                square([length-(rad*2),width-(rad*2)],center=true);
                circle(r=rad);
            }
        }union(){
        }
    }
}

module gametrak2D(){
    mount_hole_size = 4.1;
    mount_hole_x = 60;
    mount_hole_y = 52;
    mount_hole_offset = -5;
    
    for(i = [-1:2:1]){
        for(j=[-1:2:1]){
            translate([i*(mount_hole_x/2)+mount_hole_offset,j*(mount_hole_y/2)])
            circle(d=mount_hole_size);
        }
    }
}

module gametrak3D(){
    translate([0,0,-(27/2)])
    difference(){
        union(){
            color("white")
            cube([80,60,27],center=true);
            translate([0,0,-(27/2)-(20/2)])
            color("white")
            cube([40,35,20],center=true);
            color("black")
            translate([50,0,0])
            sphere(d=25);
            
        }union(){
            linear_extrude(height = 27, center = true, convexity = 10,  slices = 20) {
                gametrak2D();
            }
        }
    }
}

module motorplate3D(){
    height = 10;
    height2 = 10;
    translate([0,0,-height/2])
    linear_extrude(height = height, center = true, convexity = 10,  slices = 20) {
        motorplate2D();
    }
    translate([0,0,-height-height2/2])
    linear_extrude(height = height2, center = true, convexity = 10,  slices = 20) {
        motorplate2D_part2();
    }
}

module motorplate2D_cutout(){
    mount_hole_size = 8.1;
    mount_hole_x = 80;
    mount_hole_y = 50;
    mount_hole_offset = 5;
    
    for(i = [-1:2:1]){
        for(j=[-1:2:1]){
            translate([i*(mount_hole_x/2),j*(mount_hole_y/2)+mount_hole_offset])
            circle(d=mount_hole_size);
        }
    }
}

module motorplate2D(){
    length = 80;
    width = 100;
    board_hole_size = 8.1;
    board_hole_x = 30;
    board_hole_y = 23;
    board_hole_offset = -13;
    difference(){
        union(){
            square([width,length],center=true);
        }union(){
           motorplate2D_cutout();
            for(i = [-1:2:1]){
                for(j=[-1:2:1]){
                    translate([i*(board_hole_x/2),j*(board_hole_y/2)+board_hole_offset])
                    circle(d=board_hole_size);
                }
            }
        }
    }
}

module motorplate2D_part2(){
    length = 80;
    width = 100;
    shaft_width = 15;
    shaft_length = 60;
    
    difference(){
        union(){
            motorplate2D();
        }union(){
            translate([0,-(length/2)+(shaft_length/2)])
            square([shaft_width,shaft_length],center=true);
        }
    }
}


module motor3D(){
    rotate([90,90,0])
    translate([0,0,+81-(45/2)])
    
    difference(){
        union(){
            color("black")
            cylinder(d=175,h=45);
            color("silver")
            hull(){
                translate([0,0,44])
                cylinder(d=125,h=1);
                translate([0,0,56])
                cylinder(d=101,h=1);
            }
            
            color("silver")
            translate([0,0,-1])
            cylinder(d=135,h=1);
            
            color("silver")
            hull(){
                translate([0,0,-1])
                cylinder(d=50,h=1);
                translate([0,0,-5])
                cylinder(d=35,h=1);
            }
            
            color("DimGray")
            translate([0,0,-81+(45/2)])
            cylinder(d=16,h=81);

        }union(){
            translate([8-(3/2),0,-79+(43/2)+(45/2)])
            cube([3,20,43],center=true);
        }
    }
}

module wheel2D_cutout(){
    mount_hole_size = 4.1;
    mount_hole_x = 40;
    mount_hole_y = 40;
    union(){
        for(i = [-1:2:1]){
            for(j=[-1:2:1]){
                translate([i*(mount_hole_x/2),j*(mount_hole_y/2)])
                #circle(d=mount_hole_size);
            }
        }
    }
}

module wheel3D(){
    baseplate = 60;
    height = 100;
    diameter = 70;
    difference(){
        union(){
            color("grey")
            cube([baseplate,baseplate,3],center=true);
             
            color("blue")
            rotate([90,0,0])
            translate([-10,-height/2,-10])
            cylinder(d=diameter,h=20);
            
            color("grey")
            hull(){
                rotate([90,0,0])
                translate([-10,-height/2,-14])
                cylinder(d=10,h=28);
                
                translate([0,0,-3])
                cylinder(d=baseplate/2,h=2);
            }
        }union(){            
            linear_extrude(height = 3+0.01, center = true, convexity = 10,  slices = 20) {
                wheel2D_cutout();
            }
        }
    }
}


module mainboard2D(){
    mount_hole_size = 5.1;
    mount_hole_x = 157;
    mount_offset = 12;
    mount_hole_x_1 = 132.5;
    mount_offset_1 = 68;
    union(){
        for(i = [-1:2:1]){
            translate([mount_offset,(i*(mount_hole_x/2))])
            circle(d=mount_hole_size);
        }
        for(i = [-1:2:1]){
            translate([mount_offset_1,(i*(mount_hole_x_1/2))])
            circle(d=mount_hole_size);
        }
    }
}


module mainboard3D(){
    difference(){
        color("silver")
        union(){
            translate([10,0,0])
            cube([20,170,3],center=true);
            hull(){
                translate([69/2,0,0])
                cube([69,145,3],center=true);
                translate([96/2,0,0])
                cube([96,100,3],center=true);
            }
        }union(){
            linear_extrude(height = 3+0.01, center = true, convexity = 10,  slices = 20) {
                mainboard2D();
            }
        }
    }
}

module pcb3D(){
    difference(){
        color("green")
        union(){
            translate([-25,0,0])
            cube([50,100,3],center=true);
        }union(){
        }
    }
}

module battery3D(){
    color("lightblue")
    hull(){
        hull(){
            translate([0,5,0])
            cube([135,75,40],center=true);
            cube([65,85,40],center=true);
        }
        cube([65,75,55],center=true);
    }
}

module batteryBosch3D(){
    color("black")
    cube([190,72,56],center=true);
}