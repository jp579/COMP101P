# README for C Coursework
Written by Janos Potecki during reading week UCL Term 1 15/16.

janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 

A simple clone of the arcade game space invaders,
which uses the engduino as a controller
for the ship to move and shoot( there is a "cooldown" while shooting,
so you cannot shoot like having a machinegun).
Furthermore, the backgoundcolor is set by using
the light sensor of the arduino and the color and speed
of the "invaders" changes with the temperature measured by the engduino.

Don't forget: There are enough unemployed gfx-designers out there  (:

## Used Libraries etc.
For the game the Hermes lib for processing 2 is
used. The template and doc can be found at
https://github.com/rdlester/hermes/wiki/Tutorial-Pt.-1:-Worlds-and-Beings

JAVADOC:
http://rdlester.github.io/hermes/doc/

Furthermore for the openSCAD: http://www.openscad.org stand I used 
the Sciff.scad and spiffsans.scad font provided by the example:
https://moodle.ucl.ac.uk/mod/page/view.php?id=1416135
The Stand is made out of 2 parts, the stand itself and a UCL text which can
be put on the original stand to cover the "designer" text :)

In addition, you can change the *var* **USB_Expander** in the stand.scad
in order to widen the hole for the usb connector to fit a usb expander cable 
in the stand which allows the operation of the Engduino while plugged into 
the stand.
```
USB_Expander = 0 // Expander disabled
USB_Expander = 1 // Expander enabled
```


### INSTALLATION

#### Processing 2
For the Game I used Processing 2 with the Hermes Library. 
Don't forget to download **VERSION 2** not three.

1.	https://processing.org/download/?processing
2.	Run Processing 2 
3.	Goto **Sketch** -> **Import Library** -> **Add Library...**
4.	Search for **Hermes** and install it

#### Engduino
For the Engduino just the Engduino software is needed. Download Version 3 at
http://www.engduino.org

### RUN the game
1.	Connect the **Engduino** via **USB** to the Computer
2.	Upload **engduino/engduino.ino** to the Engduino
3. 	Turn the **Engduino ON**
4.	Open **processing2/listPorts/listPorts.pde** in Processing 2 an run it
5.	Write down the **PORT NUMBER**

	Possible console output:
	```
	[0] "/dev/cu.Bluetooth-Incoming-Port"
	[1] "/dev/cu.usbmodem14131"
	[2] "/dev/tty.Bluetooth-Incoming-Port"
	[3] "/dev/tty.usbmodem14131"
	```
	Here our Engduino is in */dev/tty.usbmodem14131* hence **PORT NUMER** is **3**.

6.	Open **processing2/game/game.pde** and choose the tab **SETUP**
7.	Edit **private int port = 0;**

	In this case we change it to 
	```
	private int port = 3;
	```
8.	Now **save**

9.	Take the Engduino and hold it **"flat"** with the **button** on the **right side**
10.	Press the button (this initializes the Engduino)
11. Start the game in Processing2
12. Move the spaceship by "rotating" the Engduino to the left or to the right
13.	Shoot by pressing the Engduino Button