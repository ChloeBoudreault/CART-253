//defines how rapidly the circle moves
final int CIRCLE_SPEED = 7;
//defines the colour of the moving circle
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
//defines the colour of the moving circle when the mouse hovers over it
final color CLICK_FILL_COLOR = color(100, 100, 250);
//defines the colour of the background
final color BACKGROUND_COLOR = color(250, 150, 150);
//defines the colour of the border of the circle
final color STROKE_COLOR = color(250, 150, 150);
//adding the example given in "Exercise Steps"
// it's a random float which give a random number between 10 and 249
// the random numbers between 10 and 249, will defines the circle size
// every time the code will be launched, the circle will be a different size
final float currentCircleSize = random (10,250);

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
  fill(NO_CLICK_FILL_COLOR);
  background(BACKGROUND_COLOR);
}

void draw() {
  //this code runs the program
    // if the position of the mouse and the position of the circle encounter 
    if (dist(mouseX, mouseY, circleX, circleY) < currentCircleSize/2) {
    // then the circle's colour changes 
    fill(CLICK_FILL_COLOR);
  }
  // otherwise colour of the circle stays the same
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  //this creates the circle itself
  ellipse(circleX, circleY, currentCircleSize, currentCircleSize);
  circleX += circleVX;
  circleY += circleVY;
  //makes sure the circle bounces off the screen in a natural way instead of half disappearing on the sides (X axis)
  // if the circle goes off the screen on the right on X axis, or the circle goes off the screen on the left of X axis
  if (circleX + currentCircleSize/2 > width || circleX - currentCircleSize/2 < 0) {
    // then the circle "goes opposite way" (counters position) and bounces off
    circleVX = -circleVX;
  }
   //makes sure the circle bounces off the screen in a natural way instead of half disappearing on the sides (Y axis)
  // if the circle goes off the screen at the bottom on Y axis, or the circle goes off the screen at the top of Y axis
  if (circleY + currentCircleSize/2 > height || circleY - currentCircleSize/2 < 0) {
  // then the circle "goes opposite way" (counters position) and bounces off
    circleVY = -circleVY;
  }
}

void mousePressed() {
  //when the mouse is pressed, the circle disappears and we see the background again before it starts over
  background(BACKGROUND_COLOR);
}