//defines how rapidly the circle moves
final int CIRCLE_SPEED = 7;
//defines the colour of the moving circle
//CHANGED!!!!!!!!
//added vairables to the colour of the moving circle
//this will give a random colours each time to code is ran
final float NO_CLICK_FILL_RED = random (100, 255);
final float NO_CLICK_FILL_GREEN = random (240, 100);
final float NO_CLICK_FILL_BLUE = random (55, 160);
//defines the colour of the moving circle when the mouse hovers over it
final color CLICK_FILL_COLOR = color(100, 100, 250);
//defines the colour of the background
final color BACKGROUND_COLOR = color(250, 150, 150);
//defines the colour of the border of the circle
final color STROKE_COLOR = color(250, 150, 150);
//defines the size of the circle
final int CIRCLE_SIZE = 50;

// defines the place of the moving circle on the X axis
int circleX;
// defines the place of the moving circle on the Y axis
int circleY;
// defines the velocity of the moving circle on the X axis
int circleVX;
// defines the velocity of the moving circle on the Y axis
int circleVY;

// this sets up the display window
void setup() {
  //this code initializes the program
  size(640, 480);
  circleX = width/2;
  circleY = height/2;
  //sets the velocity of the circle on X and Y axis
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  //sets the colour of the border of the circle/of the circle itself/of the background
  stroke(STROKE_COLOR);
  //CHANGED!!!!!!!!
  //have to change it here too otherwise it won't be applied
  fill(NO_CLICK_FILL_RED, NO_CLICK_FILL_GREEN, NO_CLICK_FILL_BLUE);
  background(BACKGROUND_COLOR);
}

void draw() {
  //this code runs the program
  // if the position of the mouse and the position of the circle encounter 
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    // then the circle's colour changes 
    fill(CLICK_FILL_COLOR);
  }
  // otherwise colour of the circle stays the same
  else {
    //CHANGED!!!!!!!!
    //have to change it here too otherwise it won't be applied
    fill(NO_CLICK_FILL_RED, NO_CLICK_FILL_GREEN, NO_CLICK_FILL_BLUE);
  }
  //this creates the circle itself
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  //makes sure the circle bounces off the screen in a natural way instead of half disappearing on the sides (X axis)
  // if the circle goes off the screen on the right on X axis, or the circle goes off the screen on the left of X axis
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    // then the circle "goes opposite way" (counters position) and bounces off
    circleVX = -circleVX;
  }
  //makes sure the circle bounces off the screen in a natural way instead of half disappearing on the sides (Y axis)
  // if the circle goes off the screen at the bottom on Y axis, or the circle goes off the screen at the top of Y axis
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    // then the circle "goes opposite way" (counters position) and bounces off
    circleVY = -circleVY;
  }

  //CHANGED!!!!!!!! 
  //added new conditional
  // if the positon of the mouse on X axis AND position of the mouse on Y axis 
  //are both on a certain part of the screen, the circle will be a certain size
  if (mouseX < width/2 && mouseY < width/2) {
    ellipse (circleX, circleY, CIRCLE_SIZE*3, CIRCLE_SIZE*3);
  } 
  //otherwise the circle remains the same size
  else {
    ellipse (circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  }
}

void mousePressed() {
  //when the mouse is pressed, the circle disappears and we see the background again before it starts over
  background(BACKGROUND_COLOR);
}