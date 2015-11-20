/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
 *
 * Upload this file to the engduino and follow the 
 * instructions in the readme.md file
 *
 * Engduino must be connected via USB to 
 * print using the Serial port.
 *
 */


#include <EngduinoButton.h>
#include <EngduinoLight.h>
#include <EngduinoAccelerometer.h>
#include <Wire.h>
#include <EngduinoThermistor.h>
#include <EngduinoLight.h>

void setup(){
	Serial.begin(9600);
	EngduinoButton.begin();
	EngduinoLight.begin();
	EngduinoAccelerometer.begin();
	EngduinoThermistor.begin();
	EngduinoLight.begin();
}

/*
* the loop checks if the button was pressed, reads the position of the engdurino, 
* the temperature and
* the light and sends it via Serial.print() to the computer	
* the first char (at pos[0] gives a number, which is the "head":
* 0 move 
* 1 temperature
* 2 light
* 3 triggered buttom
* 
* eg: string = 0:C_1:22.00_2:17_3:F
* here:
* 0: C(enter)
* 1: 22.00 (degree)
* 2: 17
* 3: F(alse)
*/
void loop(){
	// init of the accelerometer
	// must be hold in the correct position
	if(EngduinoButton.wasPressed()){
		EngduinoButton.reset();
		
		float xyz[3];
		EngduinoAccelerometer.xyz(xyz);
		float y = xyz[1];
		//Serial.println("4");

		float temperature = 0.0f;
		int light = 0;
		while (true){
			String output = "";
			// position of the engduino
			// head: 0
			EngduinoAccelerometer.xyz(xyz);
			float direction = y - xyz[1];
			if(direction > 0.4f && direction < 1.0f){
				output += "0:R_";  // [R]ight
			}
			else if(direction > -1.0f && direction < -0.4f){
				output += "0:L_";  // [L]eft   
			} else
				output += "0:C_";  // [C]enter
			// send the temperature
			// head: 1
			temperature = EngduinoThermistor.temperature(CELSIUS);
			output += "1:";
			output += temperature;
			output += "_";

			// send the light
			// head: 2
			light = EngduinoLight.lightLevel();
			output += "2:";
			output += light;
			output += "_";

			// shot fired?
			// head: 3
			output += "3:";
			if(EngduinoButton.wasPressed()){
				output += "T";   //[T]rue
				EngduinoButton.reset();
			}
			else
				output += "F"; //[F]alse
			Serial.println(output);
			delay(100);
		}
	EngduinoButton.reset();
	//Serial.print("finished");
	}	
}
