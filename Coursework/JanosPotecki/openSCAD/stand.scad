/* 
* Written by Janos Potecki during reading week UCL Term 1 15/16
* janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
* 
* Assumtion: 1 unit = 1 mm
* Change UNIT accordingly
*
*/
use <Spiff.scad>;
UNIT = 1.0;

/*
* Set USB Expander to 1, if you want to plug a 
* USB Expander into the hole => the Engduino can be 
* connected to a pc while being in the stand
* 0 is a stand just for the Engduino
*/
USB_Expander = 0;


/*
* Converts any input so it fits 
* the measures, important for the usbstuff!
* change if the usb measures dont work
* or if unit can be changed at the printer
*/
function U(x) = UNIT * x;

GROUNDBASE_Y = 50;
GROUNDBASE_X = 110;
GROUNDBASE_Z = 4;


/*
* This are the USB measures (of stick being connected
* to the stand)
* change if it doesn't fit when printed
*/
USB_STAND = 23; // height of the usb stand (bottom corner
                // of the actual usb connector


USB_X = U(15);
USB_Y = U(12) + U(USB_Expander); 
USB_Z = U(4) + U(USB_Expander);


/*
* Here the thickness of the "outter" cube of the 
* USB connector is decleared.
*/
USB_Thickness = U(2) - U(USB_Expander / 2);


//*******   DO NOT CHANGE   *************


USB_STAND_Z = USB_STAND - USB_Thickness;
OuterCube_Y = 2 * USB_Thickness + USB_Z;

module usbInnerCube(){
    cube([USB_X, USB_Y,USB_Z]);
}

module usbOutterCube(){
    difference(){
        cube([  USB_X,
                USB_Y + 2* USB_Thickness,
                USB_Z + 2* USB_Thickness]);
        translate([0, USB_Thickness, USB_Thickness])
        usbInnerCube();
    }
}

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
module usbStand(){
    stand_y = 2 * USB_Thickness + USB_Z;
    stand_x = USB_X;
    stand_z = USB_STAND_Z;
    cube([stand_x, stand_y, stand_z]);
    translate([0, OuterCube_Y, stand_z]){
       rotate([90,0,0]){
           usbOutterCube();
       }
   }
}
module groundPlate(){
    cube([GROUNDBASE_X, GROUNDBASE_Y, GROUNDBASE_Z], center = true) ;
}

groundPlate();

translate([0,0,2]){
    translate([(GROUNDBASE_X / 2) - 35, 13, 0]){
        usbStand();
    }
    translate([-(GROUNDBASE_X / 2) + 15 , 2, 0]){
        myText();
    }
    
}
