include <fan_40mm.scad>

MOTOR_DIAMETER = 35;
MOTOR_HEIGHT = 25;
MOTOR_SHAFT_DIAMETER = 2;
MOTOR_SHAFT_LENGTH = 3;
FAN_DIAMETER = 50;
CUP_DIAMETER = 86;

$fn=100;

// TODO: grille
// TODO: tube
// TODO: duct
// TOOD: battery case

// cup lid
lid(CUP_DIAMETER+3, CUP_DIAMETER, FAN_DIAMETER, MOTOR_DIAMETER);
/*
// 40mm fan
translate([0,0,10]){
    rotate([-90,0,0]){
        fan();
    }
}
*/

// motor
/*
translate([0,FAN_DIAMETER/5,-15]){
  motor(MOTOR_DIAMETER, MOTOR_HEIGHT, MOTOR_SHAFT_DIAMETER, MOTOR_SHAFT_LENGTH);
}

// fan
translate([0,FAN_DIAMETER/5,12]){
  //fan(FAN_DIAMETER, 5, 10, MOTOR_SHAFT_DIAMETER);
}
*/

// duct
/*
translate([-20/2, -CUP_DIAMETER/3, 5]){
  duct(40,25);
}
*/

module motor(diameter, height, shaft_diameter, shaft_length) {
  cylinder(r=diameter/2, h=height);
  translate([0,0,height]){
    cylinder(r=shaft_diameter/2, h=shaft_length);
  }
}
/*
module fan(diameter, height, blades, shaft_diameter){
  difference(){
    union(){
      cylinder(r=shaft_diameter*3, h=height);
      for (i = [0:blades-1]) {
        rotate([30, 0, (360*i/blades)]){
          cube([diameter/2, 1, height]);
        }
      }
    }
    translate([0,0,-1]){
      cylinder(r=shaft_diameter/2, h=height);
    }
  }
}
*/

module lid(od, id, fan_diameter, motor_diameter){
  difference(){
    cylinder(r=od/2, h=10);
    translate([0,0,-3]){
      cylinder(r=id/2, h=10);
    }
    /*
    // fan hole
    translate([0,fan_diameter/5, 0]){
      cylinder(r=fan_diameter/2, h=14);
    }
    */
    
    // fan mount opening
    translate([-(CUP_DIAMETER/2)+23,-10,21]){
        rotate([-90,0,0]){
            fan();
        }
    }
    
    // duct hole
    translate([-20/2, -id/3, 0]){      
      hull(){
        cylinder(r=8, h=14);
        translate([20,0,0]){
          cylinder(r=8, h=14);
        }
      }
    }
  }
  /*
  // motor mount
  difference(){
    union(){
      translate([-(fan_diameter/2)-3, fan_diameter/5-1.5, 5]){
        cube([fan_diameter+6, 3, 5]);
      }
      translate([-1.5,-fan_diameter/5-7, 5]){
        cube([3, fan_diameter+6, 5]);
      }
      translate([0, fan_diameter/5, 5]){
        cylinder(r=(motor_diameter/2)+3, h=5);
      }
    }
    translate([0, fan_diameter/5, -1]){
      cylinder(r=motor_diameter/2, h=14);
    }
  }
  */
}

module duct(length, angle){
  /*
  translate([-20/2,-8,0]){
    cube([40,16,5]);
  }
  */
  
  tube(10);
  translate([0,1,6]){
    rotate([angle, 0 , 0]){
      tube(length);
    }
  }
}

module tube(length){
   difference(){
    // outer
    hull(){
      cylinder(r=7, h=length);
      translate([20,0,0]){
        cylinder(r=7, h=length);
      }
    }
    // inner
    translate([0,0,-1]){
      hull(){
        cylinder(r=7-1, h=length+2);
        translate([20,0,0]){
          cylinder(r=7-1, h=length+2);
        }
      }
    }
  }
} 