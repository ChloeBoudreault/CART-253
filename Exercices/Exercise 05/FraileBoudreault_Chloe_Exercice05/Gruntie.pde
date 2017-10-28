// Gruntie
//
// A class defining the behaviour of a single Gruntie

class Gruntie {
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  int energy;
  color fill = color(255);
  
   // Gruntie(tempX, tempY, tempSize)
  //
  // Set up the Gruntie with the specified location and size
 Gruntie (int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
     size = tempSize;
   }
 
   // update()
  //
  // Move the Gruntie
   void update() {
       //Gruntie movements update randomly
       int xMoveType = floor(random(-1, 2));
       int yMoveType = floor(random(-1, 2));
       x += size * xMoveType;
       y += size * yMoveType;
    
   //checks if the Gruntie is going offscreen
   //if so, wraps it around the other side of the window 
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
   }
 
   // display()
  //
  // Draw the Gruntie on the screen as a rectangle
   void display() {
     fill(fill);
     noStroke();
     rect(x, y, size, size);
   }
} 