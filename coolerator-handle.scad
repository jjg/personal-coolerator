include <fan_40mm.scad>

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
        
        translate([59.5,0,-40]){
            cylinder(r=(BATTERY_DIAMETER/2)+3,h=50);
        }
        
        // cable mgmt
        translate([18,10,-1]){
            rotate([0,0,-10]){
                cube([38,10,11]);
            }
        }
    }
}