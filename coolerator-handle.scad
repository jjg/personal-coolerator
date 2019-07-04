include <fan_40mm.scad>

//handle();

module handle(){
    BATTERY_DIAMETER = 21;

    difference(){
        hull(){
            cylinder(r=25,h=12);
            
            translate([60,0,0]){
                cylinder(r=(BATTERY_DIAMETER/2)+3,h=12);
            }
        }
        
        translate([-20,20,-0.5]){
            rotate([90,0,0]){
                fan();
            }
        }
    }

    translate([60,0,-50]){
        cylinder(r=(BATTERY_DIAMETER/2)+3,h=50);
    }
}