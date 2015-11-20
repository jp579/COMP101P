/* 
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
 *
 * 2nd part of the stand, which can attached 
 *
 */

use <Spiff.scad>;

GROUNDBASE_Y = 37;
GROUNDBASE_X = 106;
GROUNDBASE_Z = 4;


module myText(){
   linear_extrude(height=4){   
        write("that is what ");
        translate([0,-10,0], center = true){
            write(" we have gfx");
            translate([0,-10,0]){
                write("designers for!");
            }
        }
    }
}
module groundPlate(){
    cube([GROUNDBASE_X, GROUNDBASE_Y, GROUNDBASE_Z], center = true) ;
}

module UCL(){
    cube([10,7,40]);
    translate([10,0,0]){
        cube([15,7,10]);
        translate([15,0,0]){
                cube([10,7,40]);
                translate([17,0,0]){
                    cube([10,7,40]);
                    translate([10,0,0]){
                        cube([18,7,10]);
                        translate([0,0,33]){cube([18,7,7]);}
                        translate([25,0,0]){
                            cube([10,7,40]);
                            translate([10,0,0]){
                                cube([19,7,10]);
                                }
                        }
                        
                        }
                    }
            }
        }
        
}

difference(){
groundPlate();
    translate([-(GROUNDBASE_X / 2) + 10 , 8.5, -2]){
        myText();
    }
}
translate([-GROUNDBASE_X / 2  ,-18.5, -2]){
UCL();}