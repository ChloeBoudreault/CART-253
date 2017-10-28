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
  color fill = color(255,0,0);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  Griddie(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    energy = maxEnergy;
  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
    //this statement whether or not the energy of the griddie equals to 0
    if (energy == 0) {
      return;
    }
    
    //it shows that the griddie movement is updated randomly
    int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    //this checks whether or not the griddie has disappeared offscreen
    //if it has, it wraps around the other side of the window and keeps moving
    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

    // Update the Griddie's energy
    // Note that moveEnergy is negative, so this _loses_ energy
    energy += moveEnergy;
    
    // Constrain the Griddies energy level to be within the defined bounds
    energy = constrain(energy,0,maxEnergy);
  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {
    //this checks whether the energy of the griddie is equal to 0
    //and if the energy of the other griddie's energy is 0 as well
    //if that's the case, the griddie can't gain energy from the other griddie
    if (energy == 0 || other.energy == 0) {
      return;
    }
    
    //this checks whether or not the x and y location of the griddie
    //is the same as the x and y location of another griddie
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy += collideEnergy;
      // Constrain the energy level to be within bounds
      energy = constrain(energy,0,maxEnergy);
    }
  }
  
  //added a collideGrunties function
  //if checks whether or not the x and y location of the griddie
  //is the same as the x and y location of one of the grunties
  //if it is, the griddie becomes infected and changes to a pink colour
  void collideGrunties (Griddie grunties) {
    if ( x == grunties.x && y == grunties.y) {
      fill = color (255,192,203);
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    //this fill line determines the colour of the griddie
    //and displays how much energy the griddie as left by a change in transparency
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}