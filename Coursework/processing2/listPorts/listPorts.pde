// Example by Tom Igoe
// https://processing.org/reference/libraries/serial/Serial.html

import processing.serial.*;

Serial myPort;  // The serial port

void setup() {
  // List all the available serial ports:
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
}
