include <fan_40mm.scad>
include <coolerator-lid.scad>
include <coolerator-handle.scad>
include <coolerator-duct.scad>

CUP_DIAMETER = 86;

//$fn=100;

color("red")
// cup lid
lid(CUP_DIAMETER+3, CUP_DIAMETER);

color("green")
// fan
translate([-20,-10,20]){
    rotate([-90,0,0]){
        fan();
    }
}

color("blue")
// handle
translate([0,10,10]){
    handle();
}

// duct
translate([-20/2, -CUP_DIAMETER/3, 5]){
  duct(40,25);
}