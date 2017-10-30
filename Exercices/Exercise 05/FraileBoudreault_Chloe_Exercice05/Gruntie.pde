// Gruntie
//
// A class defining the behaviour of a single Gruntie

class Gruntie {

  // Position, size, energy, and fill color
  int x;
  int y;
  //CHANGED!!!!!
  //added an array for animation
  int[] sizes = {0, 10, 15, 20, 25, 30, 35, 40};
  int i = 0;
  //int size;
  int energy;
  //CHANGED!!!!!
  //replaced colour
  //color fill = color(255);
  int redness = 0;

  //CHANGED!!!!
  //added random x and y float for noise()
  float tx = random (0, 480);
  float ty = random (0, 480);

  // Gruntie(tempX, tempY, tempSize)
  //
  // Set up the Gruntie with the specified location and size
  Gruntie (int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    //CHANGED!!!!
    //edited with sizes array
    sizes[i] = tempSize;
  }

  // update()
  //
  // Move the Gruntie
  void update() {
    //Gruntie movements update randomly
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    //CHANGED!!!!!
    //edited with sizes array
    x += sizes[i] * xMoveType;
    y += sizes[i] * yMoveType;

    //checks if the Gruntie is going offscreen
    //if so, wraps it around the other side of the window 
    if (x < 0) {
      x += width;
    } else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    } else if (y >= height) {
      y -= height;
    }
  }

  // display()
  //
  // Draw the Gruntie on the screen as a rectangle
  void display() {
    //CHANGED!!!!!
    //edited the fill colour to 'redness'
    //used Modulo for colour changes
    //fill(fill);
    fill(redness, 0, 0);
    redness = (redness + 11) % 255;
    //CHANGED!!!!
    //added black stroke
    stroke(0);
    //CHANGED!!!!!
    //added noise() so the grunties move around
    float x =  width * noise(tx);
    float y = height * noise(ty);   
    tx += 0.05;
    ty += 0.05;
    //CHANGED!!!!!
    //edited the rect with the sizes array
    //used Modulo for animation
    //the grunties will now change sizes
    //rect(x, y, size, size);
    //changed rect for ellipse
    ellipse (x, y, sizes[i], sizes[i]);
    i = (i + 1) % sizes.length;
  }
} 