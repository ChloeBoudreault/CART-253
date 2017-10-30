// Griddie
//
// A class defining the behaviour of a single Griddie
// which can move randomly in the window (within the grid),
// loses energy per move, and gains energy from overlapping
// with another Griddie.

class Griddie {
  // Limits for energy level and gains/losses
  int maxEnergy = 255;
  int moveEnergy = -1;
  int collideEnergy = 10;

  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255, 0, 0);
  //CHANGED!!!!!
  //added an array for animation
  int[] sizes = {3, 6, 9, 12, 15, 18, 21, 24};
  int i = 0;

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    //CHANGED!!!!
    //edited with sizes array
    sizes[i] = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie 
  void update() {

    //it shows that the griddie movement is updated randomly
    int xMoveType = floor(random(-1, 2));
    int yMoveType = floor(random(-1, 2));
    //CHANGED!!!!!
    //edited with sizes array
    x += sizes[i] * xMoveType;
    y += sizes[i] * yMoveType;

    //this checks whether or not the griddie has disappeared offscreen
    //if it has, it wraps around the other side of the window and keeps moving
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

  // collide(other)
  //
  // Checks for collision with the other Griddie

  void collide(Griddie other) {
    if (x == other.x && y == other.y) {
      fill = color (255, 192, 203);
    }
  }

  //added a collideGrunties function
  //if checks whether or not the x and y location of the griddie
  //is the same as the x and y location of one of the grunties
  //if it is, the griddie becomes infected and changes to a pink colour
  void collideGrunties (Griddie grunties) {
    if ( x == grunties.x && y == grunties.y) {
      fill = color (255, 0, 128);
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    //this fill line determines the colour of the griddie
    //and displays how much energy the griddie as left by a change in transparency
    fill(fill); 
    noStroke();
    //CHANGED!!!!!
    //edited the rect with the sizes array
    //used Modulo for animation
    //the griddies will now change sizes
    //rect(x, y, size, size);
    //changed rect for ellipse
    ellipse (x, y, sizes[i], sizes[i]);
    i = (i + 1) % sizes.length;
  }
}