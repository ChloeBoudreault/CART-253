//variable determines the background colour
color backgroundColor = color(200,150,150);
//global variables for the first and the second ball
Bouncer bouncer;
Bouncer bouncer2;

//this sets up the display window
void setup() {
  //this code initializes the program
  size(640,480);
  background(backgroundColor);
  //creates the two balls
  //determines their size, colours (when hovered over with mouse and not), speed 
  //and place on the screen
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

void draw() {
  //this code runs the program
  //this updates the two balls with the help of their methods in "Bouncer"
  bouncer.update();
  bouncer2.update();
  //this creates the balls themselves with the help of their methods in "Bouncer"
  bouncer.draw();
  bouncer2.draw();
}